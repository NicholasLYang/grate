require 'find'
require 'active_support/inflector'
module Grate
  class NewProject < Thor::Group
    include Thor::Actions

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
      @camel_name = classify(name)
      @snake_name = snake_case(name)
      templates_dir = File.join(
        @library_dir,
        'templates',
        'new'
      )
      Find.find(templates_dir) do |file|
        case File.extname(file)
        when '.tt'
          template(file, File.join(@project_dir, to_relative(file).gsub('.tt', '')))
        when '.dot'
          template(file, File.join(@project_dir, ".#{to_relative(file).chomp('.dot')}"))
        when /\.[A-Za-z]+/
          template(file, File.join(@project_dir, to_relative(file)))
        end
      end
    end

    def copy_bin
      bin_dir = File.join(@library_dir, 'bin')
      
      FileUtils.copy_entry(bin_dir, File.join(@project_dir, 'bin'))
    end

    private 
    def to_relative(path)
      path.gsub(/.*templates\/new\//, '')
    end

    def snake_case(name)
      name.gsub('_', '-').underscore
    end
    def classify(name)
      name.gsub('-', '_').camelize
    end
  end
end

