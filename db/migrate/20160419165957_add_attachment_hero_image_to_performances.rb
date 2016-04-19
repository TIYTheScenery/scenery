class AddAttachmentHeroImageToPerformances < ActiveRecord::Migration
  def self.up
    change_table :performances do |t|
      t.attachment :hero_image
    end
  end

  def self.down
    remove_attachment :performances, :hero_image
  end
end
