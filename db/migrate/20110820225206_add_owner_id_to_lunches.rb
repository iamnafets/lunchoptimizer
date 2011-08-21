class AddOwnerIdToLunches < ActiveRecord::Migration
  def self.up
    add_column :lunches, :owner_id, :int
  end

  def self.down
    remove_column :lunches, :owner_id
  end
end
