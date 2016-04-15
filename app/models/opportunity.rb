class Opportunity < ActiveRecord::Base
  belongs_to :company
  validates :name, presence: true
  validates :description, presence: true
  validates :contact_info, presence: true
  
end
