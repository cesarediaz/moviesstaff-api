class Person < ApplicationRecord
  paginates_per 5
  
  validates :last_name, :first_name, :aliases, presence: true

  has_many :movies_person
  has_many :movies, through: :movies_person, source: :movie, dependent: :destroy

  def as_director
    role_as('director')
  end

  def as_producer
    role_as('producer')
  end

  def as_actor
    role_as('actor')
  end

  private

  def role_as(role)
    movies.where('movies_people.role = ?', role)
  end
end
