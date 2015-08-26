# Homepage (Root path)
get '/' do
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  name = params[:name]
  age = params[:age]
  city = params[:city]

  user = User.new(name: name, age: age, city: city)
  
  if user.save
    redirect "/users/#{user.id}"
  else
    erb :'users/new'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/tweets/new' do
  @user = User.find(params[:id])
  erb :'tweets/new'
end

post '/users/:id/tweets/new' do
  content = params[:content]
  @user = User.find(params[:id])

  tweet = @user.tweets.new(content: content)

  if tweet.save
    redirect "/users/#{@user.id}"
  else
    redirect "/users/#{@user.id}/tweets/new"
  end
end
