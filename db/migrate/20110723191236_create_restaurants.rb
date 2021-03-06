class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.text :link

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
