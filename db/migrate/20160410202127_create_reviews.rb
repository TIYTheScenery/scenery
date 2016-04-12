class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :opinion
      t.integer :rating
      t.integer :user_id
      t.integer :reviewee_id
      t.string :reviewee_type

      t.timestamps null: false
    end
    add_index :reviews, :user_id
    add_index :reviews, :reviewee_id
  end
end
