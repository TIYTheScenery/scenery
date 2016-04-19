class RemoveProfileImageUrlFromPerformances < ActiveRecord::Migration
  def change
    remove_column :performances, :profile_image_url, :string
  end
end
