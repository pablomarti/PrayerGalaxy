class StoreController < ApplicationController

  #Will Paginate: https://github.com/mislav/will_paginate

  #Set up payment solution
  #https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_html_cart_upload

  #Website Payments Standard Overview
  #https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/howto_html_wp_standard_overview

  #Shopping Cart
  #https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_html_cart_upload

  #HTML Variables for Website Payments Standard
  #https://cms.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=developer/e_howto_html_Appx_websitestandard_htmlvariables
  
  def index
  	@sliderProducts = Product.order("id DESC").limit(5)
  	@mainProducts = Product.order("id DESC").limit(6)
  	@lastProduct = Product.last

  	@categories = Category.order("category ASC")
  	@categories.unshift(Category.new({:id => 0, :category => "Categories"}))
  end

  def results
  	@category = params[:category].to_i rescue 0
  	@search = params[:search]

  	query = ""
  	vOr = ""
  	items = @search.split
  	items.map{ |item|
  		if item.downcase != "search"
  			query += vOr + "name LIKE '%#{item}%' OR description LIKE '%#{item}%'"
  			vOr = " OR "
  		end
  	}

  	@products = []
  	if @category == 0
  		if query != ""
  			@products = Product.where("#{query}").paginate(:page => params[:page], :per_page => 12)
  		else
        @products = Product.where(:id => 0).paginate(:page => params[:page], :per_page => 12)
      end
  	else
  		if query != ""
  			@products = Product.where("category_id=#{@category} AND (#{query})").paginate(:page => params[:page], :per_page => 12)
  		else
  			@products = Product.where("category_id=#{@category}").paginate(:page => params[:page], :per_page => 12)
  		end
  	end

  	@categories = Category.order("category ASC")
  	@categories.unshift(Category.new({:id => 0, :category => "Categories"}))
  end

  def product
    @product = Product.find(params[:id])
    @total = ""
    @linkText = ""
    @enableCero = 0

    if !@currentUser.nil?
      if session[:cart].has_key?(params[:id])
        @total = session[:cart][params[:id]]
        @linkText = "Update cart"
        @enableCero = 1
      else
        @total = ""
        @linkText = "Add to cart"
      end
    end
  end

  def addToCheckout
    total = params[:total]

    if !session[:cart].has_key?(params[:id])
      if total.to_i > 1
        @message = "#{total} products were added to the cart"
      else
        @message = "The product was added to the cart"
      end
    else
        @message = "The cart was updated"
    end

    session[:cart]["#{params[:id]}"] = total
  end

  def updateCheckout
    session[:cart]["#{params[:id]}"] = params[:total]
    @data, @final = showCart
    @currentItem = 1
  end

  def removeFromCheckout
    session[:cart].delete_if {|key, value| key == params[:id] }
    @data = showCart
  end

  def checkout
    @data, @final = showCart
    @currentItem = 1
  end

  def showCart
    data = []
    final = 0
    items = session[:cart]
    items.each{ |key, value|
      product = Product.find(key)
      data << {:product => product, :quantity => value, :total => product.price * value.to_i}
      final += product.price * value.to_i
    }
    return [data, final]
  end

end
