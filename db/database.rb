require 'sequel'
require 'pg'
require 'yaml'
require 'erb'

config_template = ERB.new(File.read('config/database.yml'))
database_config = YAML.load(config_template.result)
config = database_config[ENV["ENVIRONMENT"]]

Sequel.connect("postgres://#{config[:username]}:#{config[:password]}@#{config[:host]}/#{config[:database]}")
