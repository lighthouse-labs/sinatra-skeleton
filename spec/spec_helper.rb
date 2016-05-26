ENV['RACK_ENV'] ||= 'test'

require_relative '../config/environment'

require 'rspec'
require 'capybara/rspec' # capybara will be loaded for tests tagged :feature
require 'database_cleaner'
require 'factory_girl'
require 'faker'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  # make the factory_girl methods available in our tests and find factories
  # in spec/factories/*.rb
  config.include FactoryGirl::Syntax::Methods
  config.before(:suite) { FactoryGirl.find_definitions }

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
