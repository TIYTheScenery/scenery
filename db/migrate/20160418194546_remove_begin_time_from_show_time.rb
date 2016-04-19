class RemoveBeginTimeFromShowTime < ActiveRecord::Migration
  def change
    remove_column :show_times, :begin_time, :time
  end
end
