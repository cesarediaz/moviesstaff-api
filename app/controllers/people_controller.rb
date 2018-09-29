class PeopleController < ActionController::Base
  layout 'application'
  
  def index
    @people = Person.all.order(:first_name, :last_name)
  end

  def new
    @person = Person.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_path, notice: 'Person was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(person_params)
        format.html { redirect_to people_path, notice: 'Ad was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :aliases)
  end
end
