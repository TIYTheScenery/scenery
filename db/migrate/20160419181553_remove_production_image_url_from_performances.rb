class RemoveProductionImageUrlFromPerformances < ActiveRecord::Migration
  def change
    remove_column :performances, :production_image_url, :string
  end
end
