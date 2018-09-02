require_relative './application_model'

class Post < Sequel::Model
  queryable_on :id, ID
  queryable_on :title, String
end
