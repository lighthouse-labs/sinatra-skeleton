# Homepage (Root path)
get '/' do
  @users =User.all
  erb :index
end

#login

get '/login' do
    erb :login
end


get '/signup' do
  erb :signup
end


get 'profile' do
  erb :profile
end

=begin

post '/login' do
  redirect '/profile'
end


get '/' do
  @pins = Pin.all.reverse
  erb :index

#@ connects pins to the view

#get profile 

get '/profile' do
  erb :profile
end

post '/profile' do
  redirect '/'
end

#get signup form

get '/signup' do
  erb :signup
end

Post 'users/create'do
 #create new user
 #redirect back to profile page
post '/signup' do
  redirect '/profile'
end

#get pins and create new pin
get '/pins/new' do
  erb :new_pin
end

#post entry user made and save
Post 


#get all pins
get 'pins' do
  @pins =Pin.all
  erb:'pins/index'
end

=end



