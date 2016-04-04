class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :owner_id
      t.integer :company_id
      t.string :name
      t.text :description
      t.string :trailer_link
      t.string :ticket_link

      t.timestamps null: false
    end
    add_index :performances, :owner_id
    add_index :performances, :company_id
  end
end
