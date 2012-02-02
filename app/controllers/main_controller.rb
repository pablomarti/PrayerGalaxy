class MainController < ApplicationController

  def index
    #render :layout => false
  end

  def about
    @data = About.find(1)
  end

  def partners
    @data = Partner.find(1)
  end

  def mission
    @data = Mission.find(1)
  end

  def vision
    @data = Vision.find(1)
  end

  def contact
    @data = ContactPage.find(1)
    @contact = Contact.new
  end

  def donate
    @donation = Donation.find(1)
  end

  def newUser
    @user = User.new
  end

  def prayerWatches
    @prayerWatches = PrayerWatch.all
  end

  def showVideo
  end

  def validateAccount
    id = params[:sec].to_i rescue 0
    activation_code = params[:hsh] rescue ""

    if id > 0 && activation_code != ""
      user = User.find(id)
      if !user.nil?
        if user.activation_code == activation_code
          user.update_attribute("active", true)
          #session[:userId] = id
          cookies[:auth_token] = user.auth_token
          logger.debug "AUTH0: " + cookies[:auth_token]
          UserMailer.welcome(user).deliver
        end
      end
    end

    redirect_to mindex_path
    return
  end

  def community
    @posts = CommunityPost.order("id DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def communityPost
    @post = CommunityPost.find(params[:id])
  end

end
