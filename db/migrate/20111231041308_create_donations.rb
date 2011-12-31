class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.text :description

      t.timestamps
    end
  end
end
