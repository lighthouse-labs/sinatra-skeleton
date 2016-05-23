configure do

  case Sinatra::Application.environment
  # Development database settings
  when :development
    # Log queries to STDOUT in development
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    set :database, {
      adapter: "sqlite3",
      database: "db/db.sqlite3"
    }
  # Test database settings
  when :test
    set :database, {
      adapter: "sqlite3",
      database: "db/test.sqlite3"
    }
  # Production database settings, tuned for heroku
  when :production
    db = URI.parse(ENV['DATABASE_URL'])  # standard heroku environment variable for configuring the database

    set :database, {
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
    }
  else
    raise ArgumentError("Expected RACK_ENV to be: development, test or production")
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
