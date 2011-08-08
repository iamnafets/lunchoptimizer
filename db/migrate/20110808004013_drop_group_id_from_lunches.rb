class DropGroupIdFromLunches < ActiveRecord::Migration
  def self.up
    remove_column :lunches, :group_id
    remove_column :lunches, :rsvp_limit
  end

  def self.down
    add_column :lunches, :group_id, :integer
    add_column :lunches, :rsvp_limit, :datetime
  end
end
