require 'thor'
require_relative './cli/generators'
require_relative './cli/server'
require_relative './cli/db'

module Grate
  class CLI < Thor
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
    register(Grate::Server, 'server', 'server', 'Runs the grate server')
    register(Grate::DB::Create, 'db create', 'db create NAME', 'Create database')
    register(Grate::Generate, 'generate', 'generate COMMAND', 'Generates scaffold code')
  end
end
  
