require 'thor'
require_relative './new_project.rb'
module Lattice
  class CLI < Thor
    register(Lattice::NewProject, 'new', 'new NAME', 'Creates a new project')
  end
end
  
