class ApplicationController < ActionController::Base

	before_filter :checkUser

  	protect_from_forgery

  	def checkUser
      if session[:cart].nil?
        session[:cart] = {}
      end

  		@currentUser = nil
  		if !session[:userId].nil?
  			@currentUser = User.find(session[:userId])
  		end
  	end

end
