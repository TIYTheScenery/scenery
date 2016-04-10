class User < ActiveRecord::Base
  has_secure_password
  has_many :performances
  has_many :user_titles
  has_many :titles, through: :user_titles, dependent: :destroy
  has_many :companies, through: :company_users

  accepts_nested_attributes_for :titles,
    allow_destroy: true

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
end
