class CreateVisions < ActiveRecord::Migration
  def change
    create_table :visions do |t|
      t.text :description
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :video

      t.timestamps
    end
  end
end
