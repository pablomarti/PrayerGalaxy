class VideosController < AdminManagementController

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    if !params[:video][:video].nil?
      videoName = params[:video][:video].original_filename.gsub(/\s/,'_') 
      @video = Video.new({:title => params[:video][:title], :video => "/worshipvideos/#{videoName}"})
    else
      @video = Video.new({:title => params[:video][:title]})
    end

    if !params[:video][:video].nil?
      tmp = params[:video][:video].tempfile
      file = File.join("public/worshipvideos", videoName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
    end

    respond_to do |format|
      if @video.save
        if !params[:video][:video].nil?
          fork do
            exec("./createVideoPics.sh '#{videoName}' &")
            exec("ffmpeg -i 'public/worshipvideos/#{videoName}' -an -ss 00:00:20 -r 1 -vframes 1 -f mjpeg -y 'app/assets/images/worship_pics/#{videoName}_1.jpg'")
            exec("ffmpeg -i 'public/worshipvideos/#{videoName}' -an -ss 00:00:20 -r 1 -vframes 1 -f mjpeg -y 'app/assets/images/worship_pics/#{videoName}_2.jpg'")
            exec("ffmpeg -i 'public/worshipvideos/#{videoName}' -an -ss 00:00:20 -r 1 -vframes 1 -f mjpeg -y 'app/assets/images/worship_pics/#{videoName}_3.jpg'")
          end

          @video.update_attribute("pic1", "worship_pics/#{videoName}_1.jpg")
          @video.update_attribute("pic2", "worship_pics/#{videoName}_2.jpg")
          @video.update_attribute("pic3", "worship_pics/#{videoName}_3.jpg")
        end

        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :ok }
    end
  end
end
