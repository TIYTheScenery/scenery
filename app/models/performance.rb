class Performance < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_many :show_times, as: :events

  accepts_nested_attributes_for :show_times,
      reject_if: :all_blank,
      allow_destroy: true
end
