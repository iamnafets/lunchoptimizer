class AddHostUsreIdToLunches < ActiveRecord::Migration
  def self.up
    add_column :lunches, :host_user_id, :integer
  end

  def self.down
    remove_column :lunches, :host_user_id
  end
end
