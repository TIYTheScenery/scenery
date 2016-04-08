class User < ActiveRecord::Base
  has_secure_password
  has_many :performances
  has_many :users_titles
  has_many :titles, through: :users_titles

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
end
