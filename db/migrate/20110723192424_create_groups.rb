class CreateGroups < ActiveRecord::Migration
  def self.up
    # Need to do this because I'm an idiot
    if table_exists? :groups
      drop_table :groups
    end
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.float :default_longitude
      t.float :default_latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
