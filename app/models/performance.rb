class Performance < ActiveRecord::Base
  has_many :genre_performances
  has_many :genres, through: :genre_performances

  validates :name, presence: true
  validates :description, presence: true
  has_many :show_times, as: :event

  accepts_nested_attributes_for :genre_performances
  accepts_nested_attributes_for :show_times,
      reject_if: :all_blank,
      allow_destroy: true
end
