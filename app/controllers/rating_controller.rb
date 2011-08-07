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

  def set
    params['ratings'].each do |id,val|
      existing = current_user.ratings.find_by_restaurant_id(id, :order => 'start_date DESC')
      if not existing.nil? and existing.rating.to_s != val
        existing.end_date = DateTime.now
        existing.save
      end

      # We need to handle the case of the user not having any ratings yet
      if existing.nil? or existing.rating.to_s != val
        current_user.ratings.create(:rating => val, :restaurant_id => id, :start_date => DateTime.now)
      end
    end
    respond_to do |format|
      format.js { render :text => params['ratings'] }
    end
  end
end
