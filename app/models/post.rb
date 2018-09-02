require_relative './application_model'

class Post < Sequel::Model
  queryable_on Post, :id, "ID"
end
