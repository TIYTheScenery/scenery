class RemoveHeroImageUrlFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :hero_image_url, :string
  end
end
