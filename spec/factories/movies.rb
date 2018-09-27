require 'faker'

FactoryBot.define do
  factory :movie do
    title Faker::Movie.quote
    release_year (1980..2018).to_a.sample
  end
end
