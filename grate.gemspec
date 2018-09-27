
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "grate/version"

Gem::Specification.new do |spec|
  spec.name          = "grate"
  spec.version       = Grate::VERSION
  spec.authors       = ["Nicholas Yang"]
  spec.email         = ["ny585@nyu.edu"]

  spec.summary       = %q{A compact but effective GraphQL framework}
  spec.description   = %q{Grate is a framework that allows you to use a declarative, compact DSL to design GraphQL APIs quickly and effectively}
  spec.homepage      = "https://grate.github.io"
  spec.license       = "MIT"

  spec.metadata      = {
    "changelog_uri" => "https://github.com/nicholaslyang/grate/blob/master/CHANGELOG.md",
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"  
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'thor', '~> 0.20.0'
  spec.add_dependency 'graphql', '~> 1.8', '>= 1.8.10'
  spec.add_dependency 'sequel', '~> 5.12', '>= 5.12.0'
  spec.add_dependency 'pg', '~> 1.1', '>= 1.1.3'
  spec.add_dependency 'dotenv', '~> 2.5', '>= 2.5.0'
  spec.add_dependency 'activesupport', '~> 5.2', '>= 5.2.1'

end
