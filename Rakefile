require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

task 'db:create_migration' do
  unless ENV["NAME"]
    puts "No NAME specified. Example usage: `rake db:create_migration NAME=create_users`"
    exit
  end

  name    = ENV["NAME"]
  version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")

  ActiveRecord::Migrator.migrations_paths.each do |directory|
    next unless File.exist?(directory)
    migration_files = Pathname(directory).children
    if duplicate = migration_files.find { |path| path.basename.to_s.include?(name) }
      puts "Another migration is already named \"#{name}\": #{duplicate}."
      exit
    end
  end

  filename = "#{version}_#{name}.rb"
  dirname  = ActiveRecord::Migrator.migrations_path
  path     = File.join(dirname, filename)

  FileUtils.mkdir_p(dirname)
  File.write path, <<-MIGRATION.strip_heredoc
    class #{name.camelize} < ActiveRecord::Migration
      def change
      end
    end
  MIGRATION

  puts path
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end
