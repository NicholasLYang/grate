require_relative './application_model'

class Post < Sequel::Model
  queryable_on Post, :id, ID
  queryable_on Post, :title, String
end
