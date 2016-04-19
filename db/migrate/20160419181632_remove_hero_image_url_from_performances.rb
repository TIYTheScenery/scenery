class RemoveHeroImageUrlFromPerformances < ActiveRecord::Migration
  def change
    remove_column :performances, :hero_image_url, :string
  end
end
