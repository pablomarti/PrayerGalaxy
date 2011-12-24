class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :user
      t.string :password
      t.string :salt
      t.boolean :active, :default => false

      t.timestamps
    end
  end
end
