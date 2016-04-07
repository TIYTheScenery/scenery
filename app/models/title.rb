class Title < ActiveRecord::Base
  has_many :professionals_titles
  has_many :titles, through: :professionals_titles
end
