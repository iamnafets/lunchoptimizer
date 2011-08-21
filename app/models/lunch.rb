class Lunch < ActiveRecord::Base
  validates_presence_of :date, :name
  validates_uniqueness_of :name

  belongs_to :host_group, :class_name => 'Group', :foreign_key => 'host_group_id'
  belongs_to :host_user, :class_name => 'User', :foreign_key => 'host_user_id'
  has_and_belongs_to_many :groups, :join_table => "lunches_groups"
  has_and_belongs_to_many :users, :join_table => 'users_lunches'

  def formatted_date
    date.strftime('%m/%d/%Y')
  end

  def formatted_date=(date_str)
    self.date = DateTime.strptime(date_str, '%m/%d/%Y')
  end
end
