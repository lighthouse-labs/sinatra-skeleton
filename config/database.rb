
configure :development do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

configure :development, :test do
  set :database, {
    'development' => {
      'adapter' => 'sqlite3',
      'database' => APP_ROOT.join('db', 'development.sqlite3')
    },
    'test' => {
      'adapter' => 'sqlite3',
      'database' => APP_ROOT.join('db', 'test.sqlite3')
    }
  }
end

configure :production do
  # Database connection is configured automatically based on the DATABASE_URL
  # environment variable. This is a feature of sinatra/activerecord support.
  #
  # If you're deploying to Heroku this will be set automatically.
end

configure do
  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end
end
