class AddGroupIdToLunch < ActiveRecord::Migration
  def self.up
    add_column :lunches, :group_id, :integer
  end

  def self.down
    remove_column :lunches, :group_id
  end
end
