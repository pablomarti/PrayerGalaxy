class DonationDescription < ActiveRecord::Migration
  def change
  	Donation.create!({:description => "Thanks for your donation, please click in the button in order to proceed."})
  end
end
