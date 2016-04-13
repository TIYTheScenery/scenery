class AddDisplayNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :display_name, :string
  end
end
