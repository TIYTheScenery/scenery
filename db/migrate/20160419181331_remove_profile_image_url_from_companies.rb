class RemoveProfileImageUrlFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :profile_image_url, :string
  end
end
