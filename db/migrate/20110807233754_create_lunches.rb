class CreateLunches < ActiveRecord::Migration
  def self.up
    create_table :lunches do |t|
      t.string :name
      t.datetime :date
      t.integer :group_id
      t.integer :restaurant_id
      t.datetime :rsvp_limit

      t.timestamps
    end
  end

  def self.down
    drop_table :lunches
  end
end
