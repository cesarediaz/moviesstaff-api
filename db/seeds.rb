User.create(email: "user@moviesstaff-api.com", password: "$123#!", password_confirmation: "$123#!")

5.times do
  Person.create do |person|
    person.first_name = Faker::Name.first_name
    person.last_name = Faker::Name.last_name
    person.aliases =  Faker::Name.initials
    person.save
    5.times do
      Movie.create do |movie|
        movie.title = Faker::Movie.quote
        movie.release_year = (1980..2018).to_a.sample
        movie.save
        MoviesPerson.create(person_id: person.id, movie_id: movie.id, role: %w(actor director producer).sample)
      end
    end   
  end
end
