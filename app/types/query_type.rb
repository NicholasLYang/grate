require_relative './post_type'

class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"
end
