require 'erb'
require 'yaml'
require 'dotenv/load'

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel/core"
    config_template = ERB.new(File.read('config/database.yml'))
    database_config = YAML.load(config_template.result)
    config = database_config[ENV["ENVIRONMENT"]]
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect("postgres://#{config[:username]}:#{config[:password]}@#{config[:host]}/#{config[:database]}") do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end
end
