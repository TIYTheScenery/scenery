class Performance < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_many :showtimes

  accepts_nested_attributes_for :showtimes,
      reject_if: :all_blank,
      allow_destroy: true
end
