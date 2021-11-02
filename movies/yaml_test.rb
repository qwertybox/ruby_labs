require 'movie'
require 'yaml/store' # подключаем библиотеку для вызова метода для хранения

store = YAML::Store.new('test.yml') # создавем обьект для хранения
first_movie = Movie.new
first_movie.title = "Spirited Away"
first_movie.director = "Hayao Miyazaki"
first_movie.year = 2001

second_movie = Movie.new
second_movie.title = "Inception"
second_movie.director = "Christopher Nolan"
second_movie.year = 2010

store.transaction do # transaction для того чтобы обезопасить файл от повреждения (изолировать запись или чтение в/из файла)
  store["Spirited Away"] = first_movie
  store["Inception"] = second_movie

  p store["Inception"]
end