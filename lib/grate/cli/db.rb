require 'sequel'
require 'thor'

module Grate
  module DB
    class Create < Thor::Group
      argument :name
      
      def create
        puts "NOT IMPLEMENTED"
      end
    end
  end
end
