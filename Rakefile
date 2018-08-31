require "active_record"

namespace :app do
  desc "Update some initially generated files"
  task update: [ "update:bin" ]

  namespace :update do
    require "rails/engine/updater"
    # desc "Adds new executables to the engine bin/ directory"
    task :bin do
      Rails::Engine::Updater.run(:create_bin_files)
    end
  end
end

task environment: "app:environment"


db_namespace = namespace :db do
    task load_config: :environment do
    ActiveRecord::Base.configurations       = ActiveRecord::Tasks::DatabaseTasks.database_configuration || {}
    ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
  end
  task migrate: :load_config do
    ActiveRecord::Base.configurations.configs_for(Rails.env).each do |db_config|
      ActiveRecord::Base.establish_connection(db_config.config)
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end
    db_namespace["_dump"].invoke
  end
end
