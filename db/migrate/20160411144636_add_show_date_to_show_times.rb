class AddShowDateToShowTimes < ActiveRecord::Migration
  def change
    add_column :show_times, :show_date, :datetime
  end
end
