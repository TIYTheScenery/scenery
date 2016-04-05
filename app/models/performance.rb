class Performance < ActiveRecord::Base
  has_many :genres_performances
  has_many :genres, through: :genres_performances
  
  validates :name, presence: true
  validates :description, presence: true
end
