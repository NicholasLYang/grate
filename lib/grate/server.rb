require 'rack'
require 'pathname'
module Grate
  class Server < Thor::Group

    def run_server
      app_file = File.join(Dir.pwd, 'config', 'application.rb')
      require app_file if FileTest.exist?(app_file)
      Rack::Handler::WEBrick.run Application.new
    end
  end
end
