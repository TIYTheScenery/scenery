class AddColumnToGenresPerformances < ActiveRecord::Migration
  def change
    add_column :genres_performances, :genre_id, :integer
    add_column :genres_performances, :performance_id, :integer
  end
end
