class CreateUsersTitles < ActiveRecord::Migration
  def change
    create_table :users_titles do |t|
      t.integer :user_id
      t.integer :title_id

      t.timestamps null: false
    end
    add_index :users_titles, :user_id
    add_index :users_titles, :title_id
  end
end
