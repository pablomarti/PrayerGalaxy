class AdminLevelsController < ApplicationController
  # GET /admin_levels
  # GET /admin_levels.json
  def index
    @admin_levels = AdminLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_levels }
    end
  end

  # GET /admin_levels/1
  # GET /admin_levels/1.json
  def show
    @admin_level = AdminLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_level }
    end
  end

  # GET /admin_levels/new
  # GET /admin_levels/new.json
  def new
    @admin_level = AdminLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_level }
    end
  end

  # GET /admin_levels/1/edit
  def edit
    @admin_level = AdminLevel.find(params[:id])
  end

  # POST /admin_levels
  # POST /admin_levels.json
  def create
    @admin_level = AdminLevel.new(params[:admin_level])

    respond_to do |format|
      if @admin_level.save
        format.html { redirect_to @admin_level, notice: 'Admin level was successfully created.' }
        format.json { render json: @admin_level, status: :created, location: @admin_level }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_levels/1
  # PUT /admin_levels/1.json
  def update
    @admin_level = AdminLevel.find(params[:id])

    respond_to do |format|
      if @admin_level.update_attributes(params[:admin_level])
        format.html { redirect_to @admin_level, notice: 'Admin level was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_levels/1
  # DELETE /admin_levels/1.json
  def destroy
    @admin_level = AdminLevel.find(params[:id])
    @admin_level.destroy

    respond_to do |format|
      format.html { redirect_to admin_levels_url }
      format.json { head :ok }
    end
  end
end
