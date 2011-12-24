class AdminManagementController < ApplicationController
  
  layout "backend"
	
	def checkUser
  		@showMenu = false
  		@currentAdmin = nil
  		if !session[:adminId].nil?
  			@showMenu = true
  			@currentAdmin = Admin.find(session[:adminId])

        if controller_name == "panel" && action_name != "logout"
          redirect_to abouts_path
        end
  		else
  			if controller_name != "panel"
				  redirect_to :controller => "panel", :action => "index"
			  elsif action_name != "index" && action_name != "login"
				  redirect_to :controller => "panel", :action => "index"
			  end
  		end
  	end

end
