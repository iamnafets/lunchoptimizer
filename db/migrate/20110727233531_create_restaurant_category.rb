class CreateRestaurantCategory < ActiveRecord::Migration
  def self.up
    create_table :restaurants_categories do |t|
      t.column "restaurant_id", :integer
      t.column "category_id", :integer
    end
  end

  def self.down
    drop_table :restaurants_categories
  end
end
