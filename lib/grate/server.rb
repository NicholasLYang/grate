require 'pathname'
module Grate
  class Server < Thor::Group

    def run_server
      `rackup` if FileTest.exist?(File.join(Dir.pwd, 'config.ru'))
    end
  end
end
