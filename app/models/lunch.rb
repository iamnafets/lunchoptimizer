class Lunch < ActiveRecord::Base
  validates_presence_of :date, :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :groups, :join_table => "lunches_groups"
  has_and_belongs_to_many :users, :join_table => 'users_lunches'

  def formatted_date
    date.strftime('%m/%d/%Y')
  end

  def formatted_date=(date_str)
    self.date = DateTime.strptime(date_str, '%m/%d/%Y')
  end
end
