class AddAnonymousToLunches < ActiveRecord::Migration
  def self.up
    add_column :lunches, :anonymous, :boolean, :default => true
  end

  def self.down
    remove_column :lunches, :anonymous
  end
end
