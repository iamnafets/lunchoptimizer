class ChangeRestaurantLinkToString < ActiveRecord::Migration
  def self.up
    change_column :restaurants, :link, :string
  end

  def self.down
    change_column :restaurants, :link, :text
  end
end
