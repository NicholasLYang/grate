require 'thor'
require_relative './cli/generators/new_project'
require_relative './cli/server'
require_relative './cli/db'
module Grate
  class CLI < Thor
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
    register(Grate::Server, 'server', 'server', 'Runs the grate server')
    register(Grate::CreateDb, 'create_db', 'create_db NAME', 'Creates database')
  end
end
  
