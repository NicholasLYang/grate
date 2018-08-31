require_relative './post_type'
require_relative "../resolvers/posts_resolver.rb"

class QueryType < GraphQL::Schema::Object
  description "The query root of this schema"

  field :post, PostType, null: true do
    description "Find a post by ID"
    argument :id, ID, required: true
  end

  # Then provide an implementation:
  def post(id)
    PostsResolver.show(id)
  end
end
       
