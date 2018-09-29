class MoviesController < ActionController::Base
  layout 'application'

  def index
    @movies = Movie.all
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
        format.html { redirect_to movies_path, notice: 'Movie was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end

  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(movies_params)
        format.html { redirect_to movies_path, notice: 'Ad was successfully updated.' }
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

  def movies_params
    params.require(:movie).permit(:id, :title, :release_year)
  end
end
