class UserActivationCode < ActiveRecord::Migration
  def change
  	add_column :users, :activation_code, :string, :default => ""
  end
end
