class User < ActiveRecord::Base
  has_secure_password
  has_many :performances
  has_many :professionals_titles
  has_many :titles, through: :professionals_titles

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
end
