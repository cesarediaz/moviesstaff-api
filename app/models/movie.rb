class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
  validates :release_year, numericality: true

  has_many :movies_person
  has_many :people, through: :movies_person, source: :person

  ROMAN_NUMS = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }

  def self.romanize(num)
    ROMAN_NUMS.map do |ltr, val|
      amt, num = num.divmod(val)
      ltr * amt
    end.join
  end
end
