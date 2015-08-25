require 'pry'

helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end

# Homepage (Root path)
get '/' do
  if current_user
    @movies = Movie.all.reverse
    erb :index
  else
    redirect '/login'
  end
end

get '/movies/:id' do
  @movie = Movie.find(params[:id])
  erb :"movies/show"
end

get '/movies/delete/:id' do 
  movie = Movie.find params[:id]
  movie.destroy if movie
  redirect '/'
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  redirect '/login'
end

get '/profile' do
  erb :profile
end

get '/movies/new' do
  erb :new_movie
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username)
  if user.password == password
    session[:user_id] = user.id
    redirect '/'
  else 
    redirect '/login'
  end
end

post '/signup' do
  user_params = {
    username: params[:username],
    password: params[:password],
    email: params[:email],
    first_name: params[:first_name],
    last_name: params[:last_name],
  }

  user = User.find_by(email: params[:email])
  if user
    session[:user_id] = user.id
    redirect '/login'
  else
    user = User.create(user_params)
    if user
      session[:user_id] = user.id  
      redirect '/'
    else
     redirect '/signup'
   end
  end
end

post 'profile' do
  redirect '/'
end

post '/movies/new' do
  title = params[:title]
  year_released = params[:year_released]
  parent_rating = params[:parent_rating]
  studio = params[:studio]
  poster_url = params[:poster_url]

  new_movie = current_user.movies.create( title: title, year_released: year_released, parent_rating: parent_rating, studio: studio, poster_url: poster_url)

  redirect "/"
end
