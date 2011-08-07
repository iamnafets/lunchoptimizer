class AddOwnerIdToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :owner_id, :int
  end

  def self.down
    remove_column :groups, :owner_id
  end
end
