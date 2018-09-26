require 'find'
module Lattice
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
      templates_dir = File.join(__dir__, "..", "..", 'templates')
      Find.find(templates_dir) do |file|
        case File.extname(file)
        when ".tt"
          template(file, File.join(Dir.pwd, name, file.gsub(/.*templates/, "").gsub(".tt", "")))
        when ".dot"
          template(file, File.join(Dir.pwd, name, ".#{name.chomp(".dot")}"))
        when /\.[A-Za-z]+/
          template(file, File.join(Dir.pwd, name, file.gsub(/.*templates/, "")))
        end
      end
    end

  end
end

