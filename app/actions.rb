# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/albums' do
  @albums = Album.all
  erb :'albums/index'
end
