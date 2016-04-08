class User < ActiveRecord::Base
  has_secure_password
  has_many :performances
  has_many :user_titles
  has_many :titles, through: :user_titles

  accepts_nested_attributes_for :titles,
    allow_destroy: true

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
end
