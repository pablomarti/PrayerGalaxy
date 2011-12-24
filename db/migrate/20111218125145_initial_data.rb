class InitialData < ActiveRecord::Migration
  
  def change
  	About.create!
  	Partner.create!
  	Vision.create!
  	ContactPage.create!(:email => "info@prayergalaxy.com", :phone => "000.000.0000")
  end

end
