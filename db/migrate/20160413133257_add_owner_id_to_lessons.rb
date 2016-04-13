class AddOwnerIdToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :owner_id, :integer
  end
end
