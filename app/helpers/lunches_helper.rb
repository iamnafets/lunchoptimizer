module LunchesHelper
  # Returns {:name, :id, :rank} of ALL restaurants included in the host group
  def rank(lunch)
    restaurants = lunch.host_group.restaurants
    users = lunch.users
    base_rank = restaurants.collect do |restaurant|
      { :name => restaurant.name,
        :id => restaurant.id,
        :rank => 1
      }
    end
    
  end

  def historical_falloff

  end

  def history_summary(users,restaurants)
    # Need something like...

  end
end
