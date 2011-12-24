class ApplicationController < ActionController::Base

	before_filter :checkUser

  	protect_from_forgery

  	def checkUser
  		@currentUser = nil
  		if !session[:userId].nil?
  			@currentUser = User.find(session[:userId])

  			if session[:cart].nil?
  				session[:cart] = {}
  			end
  		end
  	end

end
