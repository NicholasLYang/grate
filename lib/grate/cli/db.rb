require 'sequel'
require 'thor'

module Grate
  class CreateDb < Thor::Group
    argument :name

    def create_db
      puts "CREATING #{name}"
    end
  end
end
