class StaffService
  def initialize(movie, params)
    @movie = movie
    @params = params
  end

  def call
    sql_delete
    set_staff_for_movie
  end

  private

  def sql_delete
    sql = "DELETE FROM movies_people where movie_id=#{@movie.id}"
    ActiveRecord::Base.connection.execute(sql)
  end

  def set_staff_for_movie
    staff(@params['directors'], :director) if @params.has_key?('directors')
    staff(@params['producers'], :producer) if @params.has_key?('producers')
    staff(@params['casting'], :actor) if @params.has_key?('casting')
  end

  def staff(params, role)
    values = params.map { |person_id| "(#{@movie.id},#{person_id}, \'#{role}\')" }.join(",")
    sql = "INSERT INTO movies_people (movie_id, person_id, role) VALUES #{values}"
    ActiveRecord::Base.connection.execute(sql)
  end
end
