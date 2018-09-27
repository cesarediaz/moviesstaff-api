class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
  validates :release_year, numericality: true
end
