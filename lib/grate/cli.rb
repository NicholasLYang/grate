require 'thor'
require 'active_support/inflector'
require_relative './cli/generators'
require_relative './cli/server'
require_relative './cli/db'

module Grate
  class CLI < Thor
    map %w[--version -v] => :__print_version
    map %w[--build-date -bd] => :__print_build_date

    desc "--version, -v", "print the version"
    def __print_version
      puts Grate::VERSION
    end

    desc "--build-date, -bd", "prints the build date (mostly for internal dev)"
    def __print_build_date
      puts Grate::BUILD_DATE
    end
    
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
    register(Grate::Server, 'server', 'server', 'Runs the grate server')
    register(Grate::DB::Create, 'db create', 'db create NAME', 'Create database')
    register(Grate::Generate, 'generate', 'generate COMMAND', 'Generates scaffold code')
  end
end
  
