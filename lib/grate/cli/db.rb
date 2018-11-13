require 'sequel'
module Grate
  class Db < Thor::Group
    subcommand "create", Create
  end

  class Create < Thor::Group
    argument :name

    def create_db
      puts "CREATING #{name}"
    end
  end
end
