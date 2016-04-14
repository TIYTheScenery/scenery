class AddHeroImageUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :hero_image_url, :string
  end
end
