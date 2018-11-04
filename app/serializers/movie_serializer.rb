class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :directors, :producers, :casting 

  def release_year
    num = object.release_year
    Movie.romanize(num)
  end
end
