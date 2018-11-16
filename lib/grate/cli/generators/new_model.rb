require_relative './generator'
require 'find'

module Grate
  class NewModel < Generator

    argument :name
    argument :field, optional: true

    def get_project_directory
      @project_dir = File.join(Dir.pwd, name)
    end
    
    def get_lib_directory
      @library_dir = File.join(
        __dir__,
        '..',
        '..',
        '..',
        '..',
      )
    end

    def create_file
      model_template = File.join(@library_dir, 'templates', 'scaffolds', 'model.rb.tt')
      template(model_template, self.snake_case(name))
    end
  end
end
