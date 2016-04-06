class GenrePerformance < ActiveRecord::Base
  belongs_to :genre
  belongs_to :performance
  accepts_nested_attributes_for :genre
end
