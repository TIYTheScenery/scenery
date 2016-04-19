class AddAttachmentProfileImageToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :companies, :profile_image
  end
end
