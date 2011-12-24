class UsersRemoveUserField < ActiveRecord::Migration
  
  def up
  	remove_column :users, :user
  	remove_column :users, :password
  	remove_column :users, :salt
  	add_column :users, :password_hash, :string
  	add_column :users, :password_salt, :string
  end

  def down
  	add_column :users, :user, :string
  	add_column :users, :password, :string
  	add_column :users, :salt, :string
  	remove_column :users, :password_salt
  	remove_column :users, :password_salt
  end

end
