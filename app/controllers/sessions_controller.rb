class SessionsController < ApplicationController
	
	def create
	  @location = params[:location]
	  user = User.authenticate(params[:email], params[:password])
	  @status = 0
	  if user
	    session[:userId] = user.id
	    @status = 1
	  end
	end

	def destroy
	  session[:userId] = nil
	  redirect_to mindex_path
	end

end
