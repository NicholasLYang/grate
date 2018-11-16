require 'thor'
require_relative './cli/generators/new_project'
require_relative './cli/generators/new_model'
require_relative './cli/server'
require_relative './cli/db'

module Grate
  class CLI < Thor
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
    register(Grate::Server, 'server', 'server', 'Runs the grate server')
    register(Grate::DB::Create, 'db create', 'db create NAME', 'Create database')
    register(Grate::NewModel, 'generate model', 'generate model NAME', 'Creates a new model')
  end
end
  
