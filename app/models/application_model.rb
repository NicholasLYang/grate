require_relative '../types/query_type'
require 'graphql'

class Sequel::Model
  def self.queryable_on(model, query_field, query_type)
    QueryType.class_eval do
      field model, Module.const_get("#{model}Type"), null: true do
        description "Query #{model} by ID"
        argument :id, query_field, required: true
        resolve -> (obj, args, ctx) { PostsResolver.show(id) }
      end
    end
  end
end
