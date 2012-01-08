class ApplicationController < ActionController::Base

	before_filter :checkUser

  	protect_from_forgery

  	def checkUser
      if session[:cart].nil?
        session[:cart] = {}
      end

  		#@currentUser = nil
  		#if !session[:userId].nil?
  		#	@currentUser = User.find(session[:userId])
  		#end
      
      @currentUser ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  	end

end
