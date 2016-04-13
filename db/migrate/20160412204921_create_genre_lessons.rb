class CreateGenreLessons < ActiveRecord::Migration
  def change
    create_table :genre_lessons do |t|
      t.integer :genre_id
      t.integer :lesson_id

      t.timestamps null: false
    end
    add_index :genre_lessons, :genre_id
    add_index :genre_lessons, :lesson_id
  end
end
