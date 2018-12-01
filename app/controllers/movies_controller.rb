class MoviesController < ActionController::Base
  layout 'application'
  before_action :current_year, only: %i[new edit update create]
  before_action :people, only: %i[new edit update create]
  before_action :movie, only: %i[edit update destroy]
  before_action :staff, only: %i[edit update]

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
        StaffService.new(@movie, params).call
        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @movie.update_attributes(movies_params)
        StaffService.new(@movie, params).call
        format.html { redirect_to movies_path, notice: 'Movie was successfully updated.' }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  private

  def staff
    @directors = @movie.directors.pluck(:id)
    @producers = @movie.producers.pluck(:id)
    @casting = @movie.casting.pluck(:id)
  end

  def movie
    @movie = Movie.find(params[:id])
  end

  def current_year
    @current_year = Date.today.year
  end

  def people
    @people = Person.all
  end

  def movies_params
    params.require(:movie).permit(:title,
                                  :release_year,
                                  producers: [],
                                  directors: [],
                                  casting: [])
  end
end
