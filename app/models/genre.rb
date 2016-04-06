class Genre < ActiveRecord::Base
  has_many :genre_performances
  has_many :performances, through: :genre_performances
end
