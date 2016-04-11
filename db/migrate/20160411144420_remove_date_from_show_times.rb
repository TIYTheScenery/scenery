class RemoveDateFromShowTimes < ActiveRecord::Migration
  def change
    remove_column :show_times, :date, :date
  end
end
