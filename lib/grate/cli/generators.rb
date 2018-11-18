require_relative './new_model'

class Generate < Thor
  register Grate::NewModel, 'model', 'model NAME', 'Creates a new model'
end
