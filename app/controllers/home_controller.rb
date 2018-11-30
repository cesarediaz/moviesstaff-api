class HomeController < ActionController::Base
  layout 'application'

  def index;  end

  def reload_seed
    Rails.application.load_seed
    redirect_to root_path
  end
end
