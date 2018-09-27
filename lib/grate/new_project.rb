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
    end
    
    def create_files
      @name = classify(name)
      templates_dir = File.join(__dir__, "..", "..", 'templates')
      Find.find(templates_dir) do |file|
        case File.extname(file)
        when ".tt"
          template(file, File.join(Dir.pwd, name, to_relative(file).gsub(".tt", "")))
        when ".dot"
          template(file, File.join(Dir.pwd, name, ".#{to_relative(file).chomp(".dot")}"))
        when /\.[A-Za-z]+/
          template(file, File.join(Dir.pwd, name, to_relative(file)))
        end
      end
    end

    private 
    def to_relative(path)
      path.gsub(/.*templates\//, "")
    end

    def classify(name)
      name.gsub("-", "_").camelize
    end
  end
end

