class Review < ActiveRecord::Base
  belongs_to :reviewee, polymorphic: true

  validates :opinion, presence: true
end
