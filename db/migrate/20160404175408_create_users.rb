class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :person_id
      t.string :person_type
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.text :description
      t.boolean :professional
      t.string :display_name
      t.string :login_token

      t.timestamps null: false
    end
    add_index :users, :person_id
    add_index :users, :person_type
    add_index :users, :login_token
  end
end
