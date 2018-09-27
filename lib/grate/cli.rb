require 'thor'
require_relative './new_project'
require_relative './server'
module Grate
  class CLI < Thor
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
    register(Grate::Server, 'server', 'server', 'Runs the grate server')
  end
end
  
