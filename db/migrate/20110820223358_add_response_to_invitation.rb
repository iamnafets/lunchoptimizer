class AddResponseToInvitation < ActiveRecord::Migration
  def self.up
    add_column :invitations, :response, :string
  end

  def self.down
    remove_column :invitations, :response
  end
end
