class CastMember < ActiveRecord::Base
  belongs_to :show_time
  validates :name, presence: true
  validates :role, presence: true 
end
