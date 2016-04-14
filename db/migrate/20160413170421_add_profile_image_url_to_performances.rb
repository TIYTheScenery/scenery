class AddProfileImageUrlToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :profile_image_url, :string
  end
end
