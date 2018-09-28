class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
  validates :release_year, numericality: true

  has_many :movies_person
  has_many :people, through: :movies_person, source: :person
end
