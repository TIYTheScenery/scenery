class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :website_link
      t.string :facebook_link
      t.string :twitter_link
      t.string :instagram_link
      t.string :youtube_link
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
    add_index :companies, :user_id
  end
end
