class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.integer :company_id
      t.integer :venue_id
      t.string :name
      t.text :description
      t.string :contact_info

      t.timestamps null: false
    end
    add_index :opportunities, :company_id
    add_index :opportunities, :venue_id
  end
end
