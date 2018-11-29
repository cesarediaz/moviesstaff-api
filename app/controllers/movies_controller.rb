class MoviesController < ActionController::Base
  layout 'application'
  before_action :current_year, only: [:new, :edit, :update, :create]
  before_action :people, only: [:new, :edit, :update, :create]
  before_action :getMovie, only: [:edit, :update, :destroy]
  before_action :currentStaff, only: [:edit, :update]

  def index
    @movies = Movie.order(:title).page params[:page]
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movies_params)

    respond_to do |format|
      if @movie.save
        setStaffForMovie(@movie)
        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @movie.update_attributes(movies_params)
        setStaffForMovie(@movie)

        format.html { redirect_to movies_path, notice: 'Movie was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  private

  def currentStaff
    @directors = @movie.directors.pluck(:id)
    @producers = @movie.producers.pluck(:id)
    @casting = @movie.casting.pluck(:id)
  end

  def getMovie
    @movie = Movie.find(params[:id])
  end

  def setStaffForMovie(movie)
    MoviesPerson.where(movie_id: movie.id, role: :director).delete_all
    staff(params['directors'], :director) if params.has_key?('directors')

    MoviesPerson.where(movie_id: movie.id, role: :producer).delete_all
    staff(params['producers'], :producer) if params.has_key?('producers')

    MoviesPerson.where(movie_id: movie.id, role: :actor).delete_all
    staff(params['casting'], :actor) if params.has_key?('casting')
  end

  def staff(params, role)
    params.each do |id|
      MoviesPerson.create(movie_id: @movie.id, person_id: id, role: role)
    end
  end

  def current_year
    @current_year = Date.today.year
  end

  def people
    @people = Person.all
  end

  def movies_params
    params.require(:movie).permit(:title, :release_year, producers: [], directors: [], casting: [] )
  end
end
