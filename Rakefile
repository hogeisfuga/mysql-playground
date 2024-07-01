require 'active_record'
require 'yaml'
require 'active_record/railtie'
require 'rake'

namespace :db do
  desc "Migrate the database"
  task :migrate => :environment do
    ActiveRecord::Migrator.migrations_paths = [File.expand_path("../db/migrate", __FILE__)]
    ActiveRecord::MigrationContext.new(ActiveRecord::Migrator.migrations_paths).migrate
  end

  desc "Create the database"
  task :create => :environment do
    config = ActiveRecord::Base.configurations['development']
    ActiveRecord::Tasks::DatabaseTasks.create(config)
  end

  desc "Drop the database"
  task :drop => :environment do
    config = ActiveRecord::Base.configurations['development']
    ActiveRecord::Tasks::DatabaseTasks.drop(config)
  end

  task :environment do
    ActiveRecord::Base.establish_connection(YAML.load_file('database.yml')['development'])
  end
end

