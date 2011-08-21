class DropOwnerIdFromLunches < ActiveRecord::Migration
  def self.up
    remove_column :lunches, :owner_id
  end

  def self.down
    add_column :lunches, :owner_id, :integer
  end
end
