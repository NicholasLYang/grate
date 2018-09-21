class PostType < GraphQL::Schema::Object
  description "A blog post"
  field :id, ID, null: false
  field :title, String, null: false
  # fields should be queried in camel-case
  field :truncated_preview, String, null: false
  queryable_on :id, ID
  queryable_on :title, String
  queryable_on :truncated_preview, String
end
