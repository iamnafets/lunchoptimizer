class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.integer :user_id
      t.string :email
      t.datetime :sent_date
      t.integer :lunch_id

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
