require 'dotenv/load'
require 'json'
require_relative 'db/database'
require_relative 'app/schema'

class MyHandler
  def call(env)
    req = Rack::Request.new(env)
    params = JSON.parse(req.body.read)
    res = Schema.execute(params["query"])
    ['200', {'Content-Type' => 'text/html'}, [res.to_json]]
  end
end

run MyHandler.new
