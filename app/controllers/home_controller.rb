class HomeController < ApplicationController
	def index
		if not user_signed_in?
			redirect_to new_user_session_path	
		end
    @events = [{:name => 'Bamboo Garden', :company => 'Pariveda Expedia Group', :date => DateTime.new(2011,6,5)}]
	end


end
