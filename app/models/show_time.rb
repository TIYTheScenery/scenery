class ShowTime < ActiveRecord::Base
  validates :show_date, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  belongs_to :event, polymorphic: true

  has_many :cast_members, dependent: :destroy
  accepts_nested_attributes_for :cast_members,
      reject_if: :all_blank,
      allow_destroy: true
end
