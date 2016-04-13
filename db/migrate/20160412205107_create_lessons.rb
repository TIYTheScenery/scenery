class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :company_id
      t.string :name
      t.text :description
      t.integer :number_of_seats
      t.string :ticket_link

      t.timestamps null: false
    end
    add_index :lessons, :company_id
  end
end
