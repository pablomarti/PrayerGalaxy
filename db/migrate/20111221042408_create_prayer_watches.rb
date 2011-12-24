class CreatePrayerWatches < ActiveRecord::Migration
  def change
    create_table :prayer_watches do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
