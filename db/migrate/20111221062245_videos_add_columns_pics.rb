class VideosAddColumnsPics < ActiveRecord::Migration
  
  def change
  	add_column :videos, :pic1, :string
  	add_column :videos, :pic2, :string
  	add_column :videos, :pic3, :string
  end

end
