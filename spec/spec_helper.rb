ENV['RACK_ENV'] ||= 'test'

require_relative '../config/environment'

require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'
require 'faker'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  # make the capybara methods available in our tests
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  # All of the following just ensures the database is wiped
  # before every single test

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
