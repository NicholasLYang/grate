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
  
  def self.queryable_on(field_name, field_type)
    raise NameError,
          "#{self} is invalid type name. Types must end in -Type" unless is_valid_type_name

    # Gets all the various model, type and controller names.
    model = self.to_s.chomp('Type')
    type_name = self
    model_name = model.downcase
    controller = get_controller(model)
    
    if field_name == :id
      query_name = function_name = model_name
      return_type = type_name
    else
      query_name = "#{model_name}By#{camelize(field_name.to_s)}"
      function_name = "#{model_name}_by_#{field_name}"
      return_type = [type_name]
    end
    
    QueryType.class_eval do
      field query_name,
            return_type,
            null: true do
        description "Query #{model} by #{field_name}"
        argument field_name, field_type, required: true
      end
      define_method function_name do |query_args|
        controller.find_by(query_args[field_name], field_name)
      end
    end
  end
end
