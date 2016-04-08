class ShowTime < ActiveRecord::Base
  belongs_to :event, polymorphic: true
  has_many :cast_members, dependent: :destroy

  accepts_nested_attributes_for :cast_members,
    allow_destroy: true

  validates :begin_time, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

end
