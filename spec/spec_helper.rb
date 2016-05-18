ENV['RACK_ENV'] ||= 'test'

require_relative '../config/environment'

require 'rspec'
require 'capybara/rspec' # capybara will be loaded for tests tagged :feature
require 'database_cleaner'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  # All of the following just ensures the database is wiped
  # before every single test:

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
