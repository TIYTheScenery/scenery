class AddProductionImageUrlToPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :production_image_url, :string
  end
end
