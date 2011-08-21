class DeleteGroupIdFromLunches < ActiveRecord::Migration
  def self.up
    remove_column :lunches, :group_id
    add_column :lunches, :host_group_id, :integer
  end

  def self.down
    add_column :lunches, :group_id, :integer
    remove_column :lunches, :host_group_id
  end
end
