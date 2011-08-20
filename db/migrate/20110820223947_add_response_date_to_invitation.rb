class AddResponseDateToInvitation < ActiveRecord::Migration
  def self.up
    add_column :invitations, :response_date, :datetime
  end

  def self.down
    remove_column :invitations, :response_date
  end
end
