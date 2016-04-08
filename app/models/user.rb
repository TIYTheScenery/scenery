class User < ActiveRecord::Base
  has_secure_password
  has_many :performances

  validates :email, presence: true, uniqueness: true
  validates :display_name, presence: true, uniqueness: true
end
