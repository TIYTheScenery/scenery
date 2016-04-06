class CreateGenrePerformances < ActiveRecord::Migration
  def change
    create_table :genre_performances do |t|

      t.timestamps null: false
    end
  end
end
