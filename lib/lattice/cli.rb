require 'thor'
require 'find'
module Lattice
  class CLI < Thor::Group
    include Thor::Actions

    argument :name

    def self.source_root
      File.dirname(File.join(Dir.pwd, "lattice"))
    end

    def create_model_file
      Find.find(File.join(Dir.pwd, 'templates')) do |file|
        case File.extname(file)
        when ".tt"
          template(file, file.gsub("/templates", "").gsub(".tt", ""))
        when /\.[A-Za-z]+/
          template(file, file.gsub("/templates", ""))
        end
      end

    end
  end
end

