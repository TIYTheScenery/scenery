class ShowTime < ActiveRecord::Base
  validates :event_id, :event_type, :begin_time, :date, presence: true
end
