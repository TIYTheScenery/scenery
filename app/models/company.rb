class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
end
