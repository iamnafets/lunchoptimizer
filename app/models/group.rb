class Group < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "users_groups"
  has_and_belongs_to_many :restaurants
  has_and_belongs_to_many :lunches, :join_table => "lunches_groups"
  has_many :hosted_lunches, :class_name => 'Lunch', :foreign_key => 'host_group_id'
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
end
