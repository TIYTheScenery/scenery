class ShowTime < ActiveRecord::Base
  validates :event_id, :event_type, :begin_time, :date, presence: true

  def has_venue?
    venue_id == nil ? true : false
  end
end
