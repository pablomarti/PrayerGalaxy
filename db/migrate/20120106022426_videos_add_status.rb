class VideosAddStatus < ActiveRecord::Migration
  def change
  	add_column :videos, :status, :boolean, :default => false
  end
end
