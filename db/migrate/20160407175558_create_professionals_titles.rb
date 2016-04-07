class CreateProfessionalsTitles < ActiveRecord::Migration
  def change
    create_table :professionals_titles do |t|
      t.integer :professional_id
      t.integer :title_id

      t.timestamps null: false
    end
    add_index :professionals_titles, :professional_id
    add_index :professionals_titles, :title_id
  end
end
