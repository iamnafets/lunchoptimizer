class HydrateCategories < ActiveRecord::Migration
  def self.up
    ["Pizza", "Thai", "Indian", "American", "Sushi", "Sandwiches"].each do |c|
      Category.create :name => c
    end
  end

  def self.down
  end
end
