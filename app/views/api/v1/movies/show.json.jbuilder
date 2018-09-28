json.movie do
  json.id @movie.id
  json.title @movie.title
  json.release_year Movie.romanize(@movie.release_year)
end
