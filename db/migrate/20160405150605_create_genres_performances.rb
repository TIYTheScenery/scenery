class CreateGenresPerformances < ActiveRecord::Migration
  def change
    create_table :genres_performances do |t|

      t.timestamps null: false
    end
  end
end
