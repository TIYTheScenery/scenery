class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :performances
  has_many :company_users
  belongs_to :user

  def upcoming_performance
    upcoming = performances.joins("JOIN show_times ON show_times.event_id = performances.id AND show_times.event_type = 'Performance'").
        where("show_times.show_date >= ? ", DateTime.now )
    upcoming[0]
  end

  def past_performance
    performances.joins("JOIN show_times ON show_times.event_id = performances.id AND show_times.event_type = 'Performance'").
        where("show_times.show_date =< ? ", DateTime.now )
  end

end
