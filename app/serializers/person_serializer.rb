class PersonSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :first_name, :aliases, :list_of_movies

  def list_of_movies
    {
      as_director:  object.movies.where('movies_people.role = ?', 'director'),
      as_producer: object.movies.where('movies_people.role = ?', 'producer'),
      as_actor: object.movies.where('movies_people.role = ?', 'actor')
    }
  end
end
  