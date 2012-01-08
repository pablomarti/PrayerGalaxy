class VideoController < ApplicationController

  def index
  	@video = Video.last
  	@videos = Video.order("id DESC")
  	@suggestions = @video.getSuggestions
  end

  def loadVideo
  	@video = Video.find(params[:id])
  	@suggestions = @video.getSuggestions
  end

end
