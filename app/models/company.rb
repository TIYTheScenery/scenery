class Company < ActiveRecord::Base
  # include Time
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :performances
  has_many :company_users
  has_many :users, through: :company_users

  def upcoming_performance
    upcoming_show = performances.select {|c| c.show_times.last.show_date > DateTime.now}
    upcoming_show[0]
  end

end
