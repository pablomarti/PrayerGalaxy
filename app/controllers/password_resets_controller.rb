class PasswordResetsController < ApplicationController

	def new
	end

	def create
	  user = User.find_by_email(params[:email])
	  user.send_password_reset if user
	  redirect_to :controller => "main", :action => "index", :notice => "Email sent with password reset instructions"
	end

	def edit
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.nil?
	  	redirect_to mindex_path
	  end
	end

	def update
	  @user = User.find_by_password_reset_token!(params[:id])
	  if @user.password_reset_sent_at < 2.hours.ago
	    redirect_to new_password_reset_path, :notice => "Password reset has expired."
	  elsif @user.update_attributes(params[:user])
	  	@user.update_attribute("password_reset_token", "")
	  	@user.update_attribute("password_reset_sent_at", "")
	    redirect_to :controller => "main", :action => "index", :notice => "Password has been reset!"
	  else
	    render :edit
	  end
	end

end
