class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "users_groups"
  has_and_belongs_to_many :restaurants
end
