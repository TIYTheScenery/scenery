class AddIndexToGenrePerformances < ActiveRecord::Migration
  def change
    add_index :genre_performances, :genre_id
    add_index :genre_performances, :performance_id
  end
end
