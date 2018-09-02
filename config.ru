require 'dotenv/load'
require 'json'
require 'sequel'
require 'graphql'
require_relative './lib/graphql_object.rb'
require_relative './db/database'
require_relative './app/schema'
require_relative './app/types/post_type'
require_relative './app/types/query_type'
require_relative './app/models/application_model'
require_relative './app/models/post'
require_relative './app/controllers/application_controller.rb'
require_relative './app/controllers/posts_controller.rb'

class LatticeApplication
  def call(env)
    req = Rack::Request.new(env)
    params = JSON.parse(req.body.read)
    res = Schema.execute(params["query"])
    ['200', {'Content-Type' => 'text/html'}, [res.to_json]]
  end
end

run LatticeApplication.new
