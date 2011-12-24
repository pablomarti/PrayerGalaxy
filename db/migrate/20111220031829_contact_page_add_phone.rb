class ContactPageAddPhone < ActiveRecord::Migration
	
  def change
  	add_column :contact_pages, :phone, :string, :limit => 15
  end

end
