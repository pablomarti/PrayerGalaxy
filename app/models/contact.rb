class Contact < ActiveRecord::Base

	validates :name, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true
	validates :phone, :presence => true
	validates :comment, :presence => true

end
