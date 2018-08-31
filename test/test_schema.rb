require_relative "../db/database"
require_relative "../app/schema"

query_string = "
{
  post(id: 1) {
    id
    title
  }
}
"

puts(Schema.execute(query_string))
