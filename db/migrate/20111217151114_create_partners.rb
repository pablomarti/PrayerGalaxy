class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
