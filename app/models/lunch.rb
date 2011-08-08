class Lunch < ActiveRecord::Base
  has_and_belongs_to_many :groups, :join_table => "lunches_groups"
  has_and_belongs_to_many :users, :join_table => 'users_lunches'
end
