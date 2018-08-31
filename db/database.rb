require 'sequel'
require 'sqlite3'

DATABASE_ENV = "development"

DB = Sequel.connect("sqlite://#{DATABASE_ENV}.db") # requires sqlite3

DB.create_table? :posts do
  primary_key :id
  String :title
  String :content
end
