class CreateCastMembers < ActiveRecord::Migration
  def change
    create_table :cast_members do |t|
      t.string :name
      t.string :role
      t.integer :show_time_id

      t.timestamps null: false
    end
    add_index :cast_members, :show_time_id
  end
end
