class AddColumnToGenrePerformances < ActiveRecord::Migration
  def change
    add_column :genre_performances, :genre_id, :integer
    add_column :genre_performances, :performance_id, :integer
  end
end
