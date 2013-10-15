class AddActivatedColumnToUsers < ActiveRecord::Migration
  def change
    drop_table :users
    
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.boolean :activated, null: false, default: false
      t.string :activation_token, null: false
      
      t.timestamps
    end
    
    add_index(:users, :email, unique: true)
    add_index(:users, :session_token)
  end
end
