class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.integer :event_id
      t.string :event_type
      t.time :begin_time
      t.integer :venue_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.date :date

      t.timestamps null: false
    end
    add_index :show_times, :event_id
    add_index :show_times, :venue_id
  end
end
