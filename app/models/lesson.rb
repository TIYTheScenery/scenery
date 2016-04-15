class Lesson < ActiveRecord::Base
  has_many :genre_lessons
  has_many :genres, through: :genre_lessons
  has_many :show_times, as: :event, dependent: :destroy
  belongs_to :company
  has_many :reviews, as: :reviewee, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  accepts_nested_attributes_for :genre_lessons
  accepts_nested_attributes_for :show_times,
      reject_if: :all_blank,
      allow_destroy: true


  accepts_nested_attributes_for :reviews

end
