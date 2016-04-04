class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :description
      t.boolean :is_professional
      t.string :display_name
      t.string :login_token

      t.timestamps null: false
    end
    add_index :users, :login_token
  end
end
