class ChangeTypeOfDateForLunch < ActiveRecord::Migration
  def self.up
    remove_column :lunches, :date
    add_column :lunches, :date, :date
  end

  def self.down
    remove_column :lunches, :date
    add_column :lunches, :date, :datetime
  end
end
