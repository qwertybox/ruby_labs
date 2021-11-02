require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/movies') do
  @movies = store.all
  erb :index
end

get('/movies/new') do
  erb :new
end

get('/movies/:id') do
  id = params['id'].to_i
  @movie = store.find(id)
  erb :show
end

post('/movies/create') do
  "Received: #{params.inspect}"
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
  store.save(@movie)
  redirect '/movies/new' # redirect to empty new form
end
