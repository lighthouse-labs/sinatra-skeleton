# A sample Gemfile
source "https://rubygems.org"

gem 'rake'
gem 'activesupport'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'

gem 'puma'
gem 'tux'

# These gems are only installed when RACK_ENV is either `development` or `test`
group :development, :test do
  gem 'pry'
  gem 'shotgun'
  gem 'sqlite3'
end

# These gems are only installed when RACK_ENV is `production`
group :production do
  gem 'pg'
end
