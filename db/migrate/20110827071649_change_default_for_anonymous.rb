class ChangeDefaultForAnonymous < ActiveRecord::Migration
  def self.up
    remove_column :lunches, :anonymous
    add_column :lunches, :anonymous, :boolean, :default => false
  end

  def self.down
    remove_column :lunches, :anonymous
    add_column :lunches, :anonymous, :boolean
  end
end
