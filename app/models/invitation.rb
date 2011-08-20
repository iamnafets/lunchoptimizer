class Invitation < ActiveRecord::Base
  belongs_to :lunch
  has_one :user
end
