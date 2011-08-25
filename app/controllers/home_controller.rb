class HomeController < ApplicationController
	def index
		if not user_signed_in?
			redirect_to new_user_session_path	
    else
      @lunches = current_user.groups.collect { |g| g.lunches.where(:date => Date.today) }.flatten.uniq
		end
	end
end
