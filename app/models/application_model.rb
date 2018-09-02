class Sequel::Model
  include GraphQL::Schema::Member::GraphQLTypeNames
  
  def self.queryable_on(field_name, field_type)    
    model = self
    model_name = model.to_s.downcase
    if field_name == :id
      query_name = function_name = model_name
      return_type = Module.const_get("#{model}Type")
    else
      query_name = "#{model_name}By#{field_name.capitalize}"
      function_name = "#{model_name}_by_#{field_name}"
      return_type = [Module.const_get("#{model}Type")]
    end
    QueryType.class_eval do
      field query_name,
            return_type,
            null: true do
        description "Query #{model} by #{field_name}"
        argument field_name, field_type, required: true
      end
      define_method function_name do |query_args|
        PostsController.find_by(query_args[field_name], field_name)
      end
    end
  end
end
