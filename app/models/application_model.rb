require_relative '../types/query_type'
require 'graphql'
class Sequel::Model  
  def self.queryable_on(model, field_name, field_type)
    model_name = model.to_s.downcase
    if field_name == :id
      QueryType.class_eval do
        field model_name, Module.const_get("#{model}Type"), null: true do
          description "Query #{model} by ID"
          argument field_name, field_type, required: true
        end
        define_method model_name do |id|
          PostsResolver.find(id)
        end
      end
    else
      query_name = "#{model_name}By#{field_name.capitalize}"
      query_function_name = "#{model_name}_by_#{field_name}"
      QueryType.class_eval do
        field query_name,
              [Module.const_get("#{model}Type")],
              null: true do
          description "Query #{model} by #{field_name}"
          argument field_name, field_type, required: true
        end
        define_method query_function_name do |query_args|
          PostsResolver.find_by(query_args[field_name], field_name)
        end
      end
    end
  end
end
