class MoviesPerson < ApplicationRecord
  belongs_to :person
  belongs_to :movie

  validates :movie_id, :person_id, :role, presence: true
end
