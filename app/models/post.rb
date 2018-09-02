class Post < Sequel::Model
  queryable_on :id, ID
  queryable_on :title, String
end
