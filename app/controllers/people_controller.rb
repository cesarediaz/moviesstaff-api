class PeopleController < ActionController::Base
  layout 'application'
  
  def index
    @people = Person.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def people_params
    params.require(:people).permit(:id, :first_name, :last_name)
  end
end
