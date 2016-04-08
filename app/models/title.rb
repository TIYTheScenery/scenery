class Title < ActiveRecord::Base
  has_many :users_titles
  has_many :users, through: :users_titles
end
