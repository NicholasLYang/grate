require 'thor'
require_relative './new_project'
module Grate
  class CLI < Thor
    register(Grate::NewProject, 'new', 'new NAME', 'Creates a new project')
  end
end
  
