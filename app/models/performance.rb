class Performance < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
end
