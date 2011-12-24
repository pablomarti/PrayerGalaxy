class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :admin_level_id
      t.string :name
      t.string :lastname
      t.string :email
      t.boolean :active, :default => true
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
