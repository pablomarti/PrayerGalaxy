module ApplicationHelper

	def userIsLoged
		!@currentUser.nil?
	end

	def getActualLocation
		current_uri = request.env['PATH_INFO']
	end

end
