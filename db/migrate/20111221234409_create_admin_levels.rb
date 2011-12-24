class CreateAdminLevels < ActiveRecord::Migration
  def change
    create_table :admin_levels do |t|
      t.string :level

      t.timestamps
    end
  end
end
