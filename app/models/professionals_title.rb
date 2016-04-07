class ProfessionalsTitle < ActiveRecord::Base
  belongs_to :user
  belongs_to :title
end
