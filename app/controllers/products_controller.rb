class ProductsController < AdminManagementController

  # GET /products
  # GET /products.json
  def index
    @products = Product.order("id DESC").paginate(:page => params[:page], :per_page => 6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if !params[:product][:image].nil?
      imageName = params[:product][:image].original_filename.gsub(/\s/,'_') 
      tmp = params[:product][:image].tempfile
      file = File.join("app/assets/images/product_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:product][:image] = "product_pics/#{imageName}"
    end
    
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    if !params[:product][:image].nil?
      imageName = params[:product][:image].original_filename.gsub(/\s/,'_') 
      tmp = params[:product][:image].tempfile
      file = File.join("app/assets/images/product_pics", imageName)
      FileUtils.cp tmp.path, file
      FileUtils.rm tmp
      params[:product][:image] = "product_pics/#{imageName}"
    end

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :ok }
    end
  end
end
