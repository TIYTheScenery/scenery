class UsersTitle < ActiveRecord::Base
  belongs_to :titles
  belongs_to :users
end
