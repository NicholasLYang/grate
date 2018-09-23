require 'thor'
module Lattice
  class CLI < Thor
    desc "new NAME", "Creates new lattice project"
    def new(name)
      puts "Creating new project called #{name}"
    end
  end
end

Lattice::CLI.start(ARGV)
