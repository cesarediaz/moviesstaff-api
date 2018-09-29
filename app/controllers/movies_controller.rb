class MoviesController < ActionController::Base
  layout 'application'
  before_action :current_year, only: [:new, :edit]

  def index
    @movies = Movie.all.order(:title)
  end

  def new
    @movie = Movie.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @movie = Movie.new(movies_params)

    respond_to do |format|
      if @movie.save

        MoviesPerson.where(movie_id: @movie.id, role: :director).delete_all
        createStaff(params['directors'], :director) if params.has_key?('directors')

        MoviesPerson.where(movie_id: @movie.id, role: :producer).delete_all
        createStaff(params['producers'], :producer) if params.has_key?('producers')

        MoviesPerson.where(movie_id: @movie.id, role: :actor).delete_all
        createStaff(params['casting'], :actor) if params.has_key?('casting')

        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @directors = @movie.directors.pluck(:id)
    @producers = @movie.producers.pluck(:id)
    @casting = @movie.casting.pluck(:id)
  end

  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(movies_params)
        MoviesPerson.where(movie_id: @movie.id, role: :director).delete_all
        createStaff(params['directors'], :director) if params.has_key?('directors')

        MoviesPerson.where(movie_id: @movie.id, role: :producer).delete_all
        createStaff(params['producers'], :producer) if params.has_key?('producers')

        MoviesPerson.where(movie_id: @movie.id, role: :actor).delete_all
        createStaff(params['casting'], :actor) if params.has_key?('casting')

        format.html { redirect_to movies_path, notice: 'Movie was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
    end
  end

  private

  def createStaff(params, role)
    params.each do |id|
      MoviesPerson.create(movie_id: @movie.id, person_id: id, role: role)
    end
  end
  

  def current_year
    @current_year = Date.today.year
  end

  def movies_params
    params.require(:movie).permit(:title, :release_year, producers: [], directors: [], casting: [] )
  end
end
