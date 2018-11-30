class StaffService
  def initialize(movie, params)
    @movie = movie
    @params = params
  end

  def call
    delete_staff_for_movie
    set_staff_for_movie
  end

  private

  def delete_staff_for_movie
    ActiveRecord::Base.connection.execute <<-SQL.squish
      DELETE FROM movies_people
      WHERE movie_id=#{@movie.id}
    SQL
  end

  def set_staff_for_movie
    staff(@params['directors'], :director) if @params.key?('directors')
    staff(@params['producers'], :producer) if @params.key?('producers')
    staff(@params['casting'], :actor) if @params.key?('casting')
  end

  def staff(params, role)
    values = params.map do |person_id|
      "(#{@movie.id},#{person_id}, \'#{role}\')"
    end.join(',')

    ActiveRecord::Base.connection.execute <<-SQL.squish
      INSERT INTO movies_people (movie_id, person_id, role)
      VALUES #{values}
    SQL
  end
end
