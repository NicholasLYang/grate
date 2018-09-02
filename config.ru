require 'dotenv/load'
require 'json'
require 'sequel'
require 'graphql'

# Ideally should move off this, but it's so damn useful
require 'active_support/inflector'

# Load the database first
require_relative './db/database'

# Then load all the abstract
require_relative './app/types/query_type'
require_relative './app/models/application_model'
require_relative './app/controllers/application_controller.rb'
require_relative './lib/graphql_object.rb'

require_relative './app/models/post'

require_relative './app/controllers/posts_controller.rb'
require_relative './app/schema'
require_relative './app/types/post_type'


class LatticeApplication
  def call(env)
    req = Rack::Request.new(env)
    params = JSON.parse(req.body.read)
    res = Schema.execute(params["query"])
    ['200', {'Content-Type' => 'text/html'}, [res.to_json]]
  end
end

run LatticeApplication.new
