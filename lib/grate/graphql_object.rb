require 'graphql'
class GraphQL::Schema::Object
  include GraphQL::Schema::Member::GraphQLTypeNames

  def self.camelize(name)
    name.split('_').collect(&:capitalize).join
  end
  
  def self.is_valid_type_name
    self.to_s.chars.last(4).join == 'Type'
  end

  def self.get_controller(model_name)
    controller_name = "#{model_name.pluralize}Controller"
    Object.const_get(controller_name)
  end

  def self.list(options = [])
    model = self.to_s.chomp('Type')
    field_name = model.downcase.pluralize 
    type_name = [self]
    controller = get_controller(model).new
    QueryType.class_eval do
      field field_name, type_name, null: false do
        description "Get all #{model.pluralize}"
      end

      define_method field_name do
        controller.all
      end
    end
  end

  ##
  # queryable_on
  # 
  def self.queryable_on(field_name, field_type, options = {})
    raise NameError,
          "#{self} is invalid type name. Types must end in -Type" unless is_valid_type_name

    # Gets all the various model, type and controller names.
    model = self.to_s.chomp('Type')
    type_name = self
    model_name = model.downcase
    controller = get_controller(model).new

    # Adds a special case for id cause modelById is kinda redundant
    if field_name == :id
      query_name = function_name = model_name
      return_type = type_name
    else
      query_name = "#{model_name}By#{camelize(field_name.to_s)}"
      function_name = "#{model_name}_by_#{field_name}"
      return_type = [type_name]
    end

    controller_method = options.method || :find_by
    
    QueryType.class_eval do
      field query_name,
            return_type,
            null: true do
        description "Query #{model} by #{field_name}"
        argument field_name, field_type, required: options.required? || true
      end
      define_method function_name do |query_args|
        controller.public_send(controller_method, query_args[field_name], field_name)
      end
    end
  end

  private_class_method :get_controller, :camelize, :is_valid_type_name
end
