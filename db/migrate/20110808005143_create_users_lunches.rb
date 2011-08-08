class CreateUsersLunches < ActiveRecord::Migration
  def self.up
    create_table :users_lunches, :id => false do |t|
      t.integer :user_id
      t.integer :lunch_id
    end
  end

  def self.down
    drop_table :users_lunches
  end
end
