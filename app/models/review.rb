class Review < ActiveRecord::Base
  belongs_to :reviewee, polymorphic: true
  belongs_to :user
  validates :opinion, presence: true
end
