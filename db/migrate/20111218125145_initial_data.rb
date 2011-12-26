class InitialData < ActiveRecord::Migration
  
  def change
  	About.create!
  	Partner.create!
  	Vision.create!
  	ContactPage.create!(:email => "info@prayergalaxy.com")
  end

end
