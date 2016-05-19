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

get '/albums/new' do
  @album = Album.new
  erb :'albums/new'
end

post '/albums' do
  @album = Album.new(params.slice('title', 'record_label', 'release_date'))
  if @album.save
    redirect to('/albums')
  else
    erb :'albums/new'
  end
end
