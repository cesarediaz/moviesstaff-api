json.movie do
  json.id @movie.id
  json.title @movie.title
  json.release_year Movie.romanize(@movie.release_year)

  json.directors @movie.directors do |movie|
    json.first_name movie.first_name
    json.last_name movie.last_name
    json.aliases movie.aliases  
  end
  
  json.producers @movie.producers do |movie|
    json.first_name movie.first_name
    json.last_name movie.last_name
    json.aliases movie.aliases  
  end
  
  json.casting @movie.casting do |movie|
    json.first_name movie.first_name
    json.last_name movie.last_name
    json.aliases movie.aliases  
  end
end

