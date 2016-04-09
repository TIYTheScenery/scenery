class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :company_users
  has_many :users, through: :company_users

end
