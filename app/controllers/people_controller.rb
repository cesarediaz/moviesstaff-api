class PeopleController < ActionController::Base
  layout 'application'
  before_action :person, only: %i[edit update destroy]

  def index
    @people = Person.order(:first_name, :last_name).page params[:page]
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_path, notice: 'Person was successfully created.' }
      else
        format.html { render action: :new }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @person.update_attributes(person_params)
        format.html { redirect_to people_path, notice: 'Ad was successfully updated.' }
      else
        format.html { render action: :edit }
      end
    end
  end

  def destroy
    @person.destroy
    redirect_to people_url
  end

  private

  def person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name,
                                   :last_name,
                                   :aliases)
  end
end
