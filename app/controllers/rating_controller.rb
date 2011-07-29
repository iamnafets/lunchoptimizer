class RatingController < ApplicationController
  def index
    @restaurants = 
      (Group.find :all,
        :include => [:restaurants, :users], :conditions => 'users.id = '+current_user.id.to_s)
      .collect{|g| g.restaurants}.flatten.uniq.collect do |r|
        rating = r.ratings.where(:user_id => current_user, :end_date => nil).first
        {:restaurant => r, :rating => (rating.nil? ? 50 : rating.rating)}
      end
  end
end
