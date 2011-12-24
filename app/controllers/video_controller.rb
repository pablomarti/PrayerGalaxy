class VideoController < ApplicationController

  def index
  	@video = Video.last
  	@videos = Video.order("id DESC")
  end

  def loadVideo
  	@video = Video.find(params[:id])
  end

end
