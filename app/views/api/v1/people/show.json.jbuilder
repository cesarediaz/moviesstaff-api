json.person do
  json.id @person.id
  json.first_name @person.first_name
  json.last_name @person.last_name
  json.aliases @person.aliases
end

json.movies do
  json.as_director @person.as_director do |movie|
    json.id movie.id
    json.title movie.title
    json.release_year movie.release_year
  end
  
  json.as_producer @person.as_producer do |movie|
    json.id movie.id
    json.title movie.title
    json.release_year movie.release_year
  end
  
  json.as_actor @person.as_actor do |movie|
    json.id movie.id
    json.title movie.title
    json.release_year movie.release_year
  end
end

