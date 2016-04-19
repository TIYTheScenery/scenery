class AddAttachmentHeroImageToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :hero_image
    end
  end

  def self.down
    remove_attachment :companies, :hero_image
  end
end
