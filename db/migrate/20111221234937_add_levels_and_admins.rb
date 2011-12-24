class AddLevelsAndAdmins < ActiveRecord::Migration
  
  def change
  	AdminLevel.create!({:level => "Root"})
  	AdminLevel.create!({:level => "User"})

  	Admin.create!({ 	:admin_level_id => 1, 
	  					:name => "Root", 
	  					:lastname => "Root",
	  					:email => "root@prayergalaxy.com",
	  					:password => "welcome",
	  					:password_confirmation => "welcome"})
  end

end
