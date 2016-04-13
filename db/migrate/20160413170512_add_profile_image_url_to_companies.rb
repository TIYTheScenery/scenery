class AddProfileImageUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :profile_image_url, :string
  end
end
