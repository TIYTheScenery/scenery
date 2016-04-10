class Performance < ActiveRecord::Base
  has_many :genre_performances
  has_many :genres, through: :genre_performances
  belongs_to :company
  has_many :reviews, as: :reviewee, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  has_many :show_times, as: :event, dependent: :destroy

  accepts_nested_attributes_for :genre_performances
  accepts_nested_attributes_for :show_times,
      reject_if: :all_blank,
      allow_destroy: true,
      update_only: true


  def past_production?
    show_times.last.date < DateTime.now
  end

end
