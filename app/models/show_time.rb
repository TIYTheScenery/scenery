class ShowTime < ActiveRecord::Base
  belongs_to :event, polymorphic: true

  validates :begin_time, presence: true
  validates :show_date, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

end
