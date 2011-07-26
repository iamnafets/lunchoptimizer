class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_menu_variables

  def load_menu_variables
    if user_signed_in?
      @menu_groups = current_user.groups :order => 'name'
    else

    end
  end
end
