module Grate
  class Server
    def run_server
      `rackup` if Pathname.exist?(File.join(Dir.pwd, 'config.ru'))
    end
  end
end
