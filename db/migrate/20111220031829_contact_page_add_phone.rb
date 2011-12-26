class ContactPageAddPhone < ActiveRecord::Migration
	
  def change
  	add_column :contact_pages, :phone, :string, :limit => 15

  	cp = ContactPage.find(1)
  	cp.update_attribute("phone", "000.000.0000")
  end

end
