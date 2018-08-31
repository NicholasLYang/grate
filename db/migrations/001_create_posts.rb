require 'sequel'

Sequel.migration do
  change do
    create_table?(:posts) do
      primary_key :id
      String :title
      String :content
    end
  end
end
