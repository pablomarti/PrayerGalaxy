class CommunityPostsController < AdminManagementController
  # GET /community_posts
  # GET /community_posts.json
  def index
    @community_posts = CommunityPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @community_posts }
    end
  end

  # GET /community_posts/1
  # GET /community_posts/1.json
  def show
    @community_post = CommunityPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @community_post }
    end
  end

  # GET /community_posts/new
  # GET /community_posts/new.json
  def new
    @community_post = CommunityPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @community_post }
    end
  end

  # GET /community_posts/1/edit
  def edit
    @community_post = CommunityPost.find(params[:id])
  end

  # POST /community_posts
  # POST /community_posts.json
  def create
    if !params[:community_post][:image].nil?
      imageName = params[:community_post][:image].original_filename.gsub(/\s/,'_') 
      tmp = params[:community_post][:image].tempfile
      file = File.join("app/assets/images/community_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:community_post][:image] = "community_pics/#{imageName}"
    end

    @community_post = CommunityPost.new(params[:community_post])

    respond_to do |format|
      if @community_post.save
        format.html { redirect_to @community_post, notice: 'Community post was successfully created.' }
        format.json { render json: @community_post, status: :created, location: @community_post }
      else
        format.html { render action: "new" }
        format.json { render json: @community_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /community_posts/1
  # PUT /community_posts/1.json
  def update
    @community_post = CommunityPost.find(params[:id])

    if !params[:community_post][:image].nil?
      imageName = params[:community_post][:image].original_filename.gsub(/\s/,'_') 
      tmp = params[:community_post][:image].tempfile
      file = File.join("app/assets/images/community_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:community_post][:image] = "community_pics/#{imageName}"
    end   

    respond_to do |format|
      if @community_post.update_attributes(params[:community_post])
        format.html { redirect_to @community_post, notice: 'Community post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @community_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /community_posts/1
  # DELETE /community_posts/1.json
  def destroy
    @community_post = CommunityPost.find(params[:id])
    @community_post.destroy

    respond_to do |format|
      format.html { redirect_to community_posts_url }
      format.json { head :ok }
    end
  end
end
