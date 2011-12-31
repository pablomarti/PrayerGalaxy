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

end
