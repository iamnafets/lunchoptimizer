class AddGroupsRestaurants < ActiveRecord::Migration
  def self.up
    create_table :groups_restaurants, :id => false do |t|
      t.integer :group_id
      t.integer :restaurant_id
    end
  end

  def self.down
    drop_table :groups_restaurants
  end
end
