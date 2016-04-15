class GenreLesson < ActiveRecord::Base
  belongs_to :genre
  belongs_to :lesson
end
