class InsertMission < ActiveRecord::Migration
  def up
  	Mission.create!({:description => "Test Mission"})
  end

  def down
  	Mission.destroy_all
  end
end
