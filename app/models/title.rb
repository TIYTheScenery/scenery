class Title < ActiveRecord::Base
  has_many :user_titles
  has_many :users, through: :user_titles
end
