class Person < ApplicationRecord
  validates :last_name, :first_name, :aliases, presence: true

  has_many :movies_person
  has_many :movies, through: :movies_person, source: :movie
  

  def as_director
    movies.where('movies_people.role = ?', 'director')
  end

  def as_producer
    movies.where('movies_people.role = ?', 'producer')
  end

  def as_actor
    movies.where('movies_people.role = ?', 'actor')
  end
end
