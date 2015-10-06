# Homepage (Root path)
get '/' do
  erb :index
end



get '/login' do
    erb :login
end

post '/login'do
  redirect '/profile'
end



get '/profile' do
  erb :profile
end

post '/profile' do
  redirect '/'
end



get '/signup' do
  erb :signup
end

post '/signup' do
  redirect '/'
end







