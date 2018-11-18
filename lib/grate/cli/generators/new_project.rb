require 'find'
require 'active_support/inflector'
require_relative './generator'
module Grate
  class NewProject < Generator

    argument :name

    def self.source_root
      File.dirname(__FILE__)
    end


    def create_directory
      Dir.mkdir name
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
    
    def create_files
      @camel_name = self.class.camel_case(name)
      @snake_name = self.class.snake_case(name)
      templates_dir = File.join(
        @library_dir,
        'templates',
        'new'
      )
      Find.find(templates_dir) do |file|
        case File.extname(file)
        when '.tt'
          template(file, File.join(@project_dir, self.class.to_relative(file).gsub('.tt', '')))
        when '.dot'
          template(file, File.join(@project_dir, ".#{self.class.to_relative(file).chomp('.dot')}"))
        when /\.[A-Za-z]+/
          template(file, File.join(@project_dir, self.class.to_relative(file)))
        end
      end
    end

    def copy_bin
      bin_dir = File.join(@library_dir, 'bin')
      
      FileUtils.copy_entry(bin_dir, File.join(@project_dir, 'bin'))
    end

  end
end

