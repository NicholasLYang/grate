require_relative './generators/base_generator'
require_relative './generators/new_model'
require_relative './generators/new_project'

module Grate
  class Generate < Thor
    register Grate::NewModel, 'model', 'model NAME', 'Creates a new model'
  end
end
