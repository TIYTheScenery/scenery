class ShowTime < ActiveRecord::Base
  belongs_to :performance
  validates :event_id, :event_type, :begin_time, :date, :address, :city, :state, :zip_code, presence: true

end
