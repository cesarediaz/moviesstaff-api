class Person < ApplicationRecord
  validates :last_name, :first_name, :aliases, presence: true
end
