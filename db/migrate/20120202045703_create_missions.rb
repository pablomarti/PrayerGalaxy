class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.text :description

      t.timestamps
    end
  end
end
