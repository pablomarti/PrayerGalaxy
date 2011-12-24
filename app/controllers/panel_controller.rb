class PanelController < AdminManagementController
  
  def index
  	@message = ""
  end

  def login
	  admin = Admin.authenticate(params[:email], params[:password])
	  @message = ""
	  if admin
	    session[:adminId] = admin.id
	    redirect_to abouts_path
	    return
	  else
	  	@message = "Invalid user and password combination"
	  	render :index
	  end
  end

  def logout
 	session[:adminId] = nil
	redirect_to :controller => "panel", :action => "index"
  end

end
