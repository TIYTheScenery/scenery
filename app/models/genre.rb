class Genre < ActiveRecord::Base
  has_many :genres_performances
  has_many :performances, through: :genres_performances
end
