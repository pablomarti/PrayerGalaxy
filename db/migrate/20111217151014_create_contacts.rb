class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :about
      t.text :comment

      t.timestamps
    end
  end
end
