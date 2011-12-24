class PrayerWatchesController < ApplicationController
  layout "backend"
  # GET /prayer_watches
  # GET /prayer_watches.json
  def index
    @prayer_watches = PrayerWatch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @prayer_watches }
    end
  end

  # GET /prayer_watches/1
  # GET /prayer_watches/1.json
  def show
    @prayer_watch = PrayerWatch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @prayer_watch }
    end
  end

  # GET /prayer_watches/new
  # GET /prayer_watches/new.json
  def new
    @prayer_watch = PrayerWatch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @prayer_watch }
    end
  end

  # GET /prayer_watches/1/edit
  def edit
    @prayer_watch = PrayerWatch.find(params[:id])
  end

  # POST /prayer_watches
  # POST /prayer_watches.json
  def create
    @prayer_watch = PrayerWatch.new(params[:prayer_watch])

    respond_to do |format|
      if @prayer_watch.save
        format.html { redirect_to @prayer_watch, notice: 'Prayer watch was successfully created.' }
        format.json { render json: @prayer_watch, status: :created, location: @prayer_watch }
      else
        format.html { render action: "new" }
        format.json { render json: @prayer_watch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /prayer_watches/1
  # PUT /prayer_watches/1.json
  def update
    @prayer_watch = PrayerWatch.find(params[:id])

    respond_to do |format|
      if @prayer_watch.update_attributes(params[:prayer_watch])
        format.html { redirect_to @prayer_watch, notice: 'Prayer watch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @prayer_watch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prayer_watches/1
  # DELETE /prayer_watches/1.json
  def destroy
    @prayer_watch = PrayerWatch.find(params[:id])
    @prayer_watch.destroy

    respond_to do |format|
      format.html { redirect_to prayer_watches_url }
      format.json { head :ok }
    end
  end
end
