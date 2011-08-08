class CreateLunchesGroups < ActiveRecord::Migration
  def self.up
    create_table :lunches_groups, :id => false do |t|
      t.integer :lunch_id
      t.integer :group_id
    end
  end

  def self.down
    drop_table :lunches_groups
  end
end
