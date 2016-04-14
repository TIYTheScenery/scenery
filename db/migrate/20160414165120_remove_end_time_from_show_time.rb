class RemoveEndTimeFromShowTime < ActiveRecord::Migration
  def change
    remove_column :show_times, :end_time, :time
  end
end
