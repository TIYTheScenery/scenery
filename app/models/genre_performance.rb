class GenrePerformance < ActiveRecord::Base
  belongs_to :genre
  belongs_to :performance
end
