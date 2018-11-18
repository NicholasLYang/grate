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

    def create_model
      @camel_name = self.class.camel_case(name)
      @snake_name = self.class.snake_case(name)
      model_template = File.join(@library_dir, 'templates', 'scaffolds', 'model.rb.tt')
      template(model_template, "#{@snake_name}.rb")
    end
  end
end
