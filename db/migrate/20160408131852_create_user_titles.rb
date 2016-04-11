class CreateUserTitles < ActiveRecord::Migration
  def change
    create_table :user_titles do |t|
      t.integer :user_id
      t.integer :title_id

      t.timestamps null: false
    end
    add_index :user_titles, :user_id
    add_index :user_titles, :title_id
  end
end
