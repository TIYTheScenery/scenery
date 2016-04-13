class AddHeroImageUrlToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :hero_image_url, :string
  end
end
