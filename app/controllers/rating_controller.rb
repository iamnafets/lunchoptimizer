class RatingController < ApplicationController
  def index
    @restaurants = 
      (Group.find :all,
        :include => [:restaurants, :users], :conditions => 'users.id = '+current_user.id.to_s)
      .collect{|g| g.restaurants}.flatten.uniq
  end
end
