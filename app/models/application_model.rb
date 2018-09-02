require_relative '../types/query_type'
require 'graphql'
class Sequel::Model  
  def self.queryable_on(model, query_field, query_type)
    field_name = model.to_s.downcase
    if query_field == :id
      QueryType.class_eval do
        field field_name, Module.const_get("#{model}Type"), null: true do
          description "Query #{model} by ID"
          argument :id, query_type, required: true
        end
        define_method field_name do |id|
          PostsResolver.show(id)
        end
      end
    end
  end
end
