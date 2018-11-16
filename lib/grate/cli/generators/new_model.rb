require 'find'
module Grate
  class NewModel < Thor::Group
    include Thor::Actions

    argument :name
    option :field
    def print
      puts @name
      puts @field
    end
  end
end
