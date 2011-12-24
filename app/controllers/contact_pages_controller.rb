class ContactPagesController < ApplicationController
  layout "backend"
  # GET /contact_pages
  # GET /contact_pages.json
  def index
    @contact_pages = ContactPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_pages }
    end
  end

  # GET /contact_pages/1
  # GET /contact_pages/1.json
  def show
    @contact_page = ContactPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_page }
    end
  end

  # GET /contact_pages/new
  # GET /contact_pages/new.json
  def new
    @contact_page = ContactPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_page }
    end
  end

  # GET /contact_pages/1/edit
  def edit
    @contact_page = ContactPage.find(params[:id])
  end

  # POST /contact_pages
  # POST /contact_pages.json
  def create
    @contact_page = ContactPage.new(params[:contact_page])

    respond_to do |format|
      if @contact_page.save
        format.html { redirect_to @contact_page, notice: 'Contact page was successfully created.' }
        format.json { render json: @contact_page, status: :created, location: @contact_page }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_pages/1
  # PUT /contact_pages/1.json
  def update
    @contact_page = ContactPage.find(params[:id])

    respond_to do |format|
      if @contact_page.update_attributes(params[:contact_page])
        format.html { redirect_to @contact_page, notice: 'Contact page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_pages/1
  # DELETE /contact_pages/1.json
  def destroy
    @contact_page = ContactPage.find(params[:id])
    @contact_page.destroy

    respond_to do |format|
      format.html { redirect_to contact_pages_url }
      format.json { head :ok }
    end
  end
end
