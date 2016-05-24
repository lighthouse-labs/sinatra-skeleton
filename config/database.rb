
configure :development do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

configure :development, :test do
  set :database, {
    adapter: 'sqlite3',
    database: APP_ROOT.join('db', "#{Sinatra::Application.environment}.sqlite3")
  }
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'])  # standard heroku environment variable for configuring the database

  set :database, {
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  }
end

configure do
  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end
end
