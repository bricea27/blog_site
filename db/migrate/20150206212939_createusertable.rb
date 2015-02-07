class Createusertable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :username
      t.text :password_digest
      t.text :admin_status, :default => false

      t.timestamps null: false
    end
  end
end
