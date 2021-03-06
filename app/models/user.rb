class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_and_belongs_to_many :groups, :join_table => "users_groups"
  has_many :ratings
  has_many :owned_groups, :class_name => 'Group', :foreign_key => 'owner_id'
  has_and_belongs_to_many :lunches, :join_table => 'users_lunches'
  has_many :hosted_lunches, :class_name => 'Lunch', :foreign_key => 'host_user_id'
end
