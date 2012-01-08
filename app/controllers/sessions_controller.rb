class SessionsController < ApplicationController

=begin
	def create
	  @location = params[:location]
	  user = User.authenticate(params[:email], params[:password])
	  @status = 0
	  if user
	    session[:userId] = user.id
	    @status = 1
	  end
	end
=end

	def create
	  @location = params[:location]
	  user = User.authenticate(params[:email], params[:password])
	  @status = 0

	  if user
	  	@status = 1
	    if params[:remember_me]
	      cookies.permanent[:auth_token] = user.auth_token
	    else
	      cookies[:auth_token] = user.auth_token
	    end
	  end
	end

	def destroy
	  #session[:userId] = nil
	  cookies.delete(:auth_token)

	  redirect_to mindex_path
	end

end
