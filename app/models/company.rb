class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :performances
  has_many :company_users
  has_many :users, through: :company_users

end
