class Performance < ActiveRecord::Base
  belongs_to :company
  validates :name, presence: true
  validates :description, presence: true

  has_many :show_times, as: :event, dependent: :destroy
  accepts_nested_attributes_for :show_times,
      reject_if: :all_blank,
      allow_destroy: true

  has_many :genre_performances
  has_many :genres, through: :genre_performances
  accepts_nested_attributes_for :genre_performances

  has_many :reviews, as: :reviewee, dependent: :destroy
  accepts_nested_attributes_for :reviews,
    allow_destroy: true

end
