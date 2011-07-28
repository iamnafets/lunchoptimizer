class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_and_belongs_to_many :categories, :join_table => 'restaurants_categories'
  has_and_belongs_to_many :groups
end
