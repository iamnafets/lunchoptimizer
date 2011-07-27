class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.column "restaurant_id", :integer
      t.column "user_id", :integer
      t.column "start_date", :datetime
      t.column "end_date", :datetime
      t.column "rating", :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end
