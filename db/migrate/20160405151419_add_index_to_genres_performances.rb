class AddIndexToGenresPerformances < ActiveRecord::Migration
  def change
    add_index :genres_performances, :genre_id
    add_index :genres_performances, :performance_id
  end
end
