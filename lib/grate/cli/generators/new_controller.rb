require 'find'

module Grate
  class NewController < BaseGenerator
    argument :name
    argument :field, optional: true

    def self.source_root
      File.dirname(__FILE__)
    end

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
      controller_template = File.join(@library_dir, 'templates', 'scaffolds', 'controller.rb.tt')
      template(controller_template, File.join('app', 'models', "#{@snake_name}_controller.rb"))
    end
  end
end
