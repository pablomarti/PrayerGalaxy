class VisionsController < AdminManagementController
  
  # GET /visions
  # GET /visions.json
  def index
    @visions = Vision.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visions }
    end
  end

  # GET /visions/1
  # GET /visions/1.json
  def show
    @vision = Vision.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vision }
    end
  end

  # GET /visions/new
  # GET /visions/new.json
  def new
    @vision = Vision.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vision }
    end
  end

  # GET /visions/1/edit
  def edit
    @vision = Vision.find(params[:id])
  end

  # POST /visions
  # POST /visions.json
  def create
    @vision = Vision.new(params[:vision])

    respond_to do |format|
      if @vision.save
        format.html { redirect_to @vision, notice: 'Vision was successfully created.' }
        format.json { render json: @vision, status: :created, location: @vision }
      else
        format.html { render action: "new" }
        format.json { render json: @vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visions/1
  # PUT /visions/1.json
  def update
    @vision = Vision.find(params[:id])

    if !params[:vision][:image1].nil?
      imageName = params[:vision][:image1].original_filename.gsub(/\s/,'_') 
      tmp = params[:vision][:image1].tempfile
      file = File.join("app/assets/images/vision_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:vision][:image1] = "vision_pics/#{imageName}"
    end

    if !params[:vision][:image2].nil?
      imageName = params[:vision][:image2].original_filename.gsub(/\s/,'_') 
      tmp = params[:vision][:image2].tempfile
      file = File.join("app/assets/images/vision_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:vision][:image2] = "vision_pics/#{imageName}"
    end

    if !params[:vision][:image3].nil?
      imageName = params[:vision][:image3].original_filename.gsub(/\s/,'_') 
      tmp = params[:vision][:image3].tempfile
      file = File.join("app/assets/images/vision_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:vision][:image3] = "vision_pics/#{imageName}"
    end

    if !params[:vision][:video].nil?
      videoName = params[:vision][:video].original_filename.gsub(/\s/,'_') 
      tmp = params[:vision][:video].tempfile
      file = File.join("public/visionvideos", videoName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:vision][:video] = "/visionvideos/#{videoName}"
    end

    respond_to do |format|
      if @vision.update_attributes(params[:vision])
        format.html { redirect_to @vision, notice: 'Vision was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @vision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visions/1
  # DELETE /visions/1.json
  def destroy
    @vision = Vision.find(params[:id])
    @vision.destroy

    respond_to do |format|
      format.html { redirect_to visions_url }
      format.json { head :ok }
    end
  end
end
