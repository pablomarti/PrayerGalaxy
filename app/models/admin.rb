class Admin < ActiveRecord::Base

	belongs_to :admin_level
	
	attr_accessible :email, :password, :password_confirmation, :name, :lastname, :admin_level_id

	attr_accessor :password
	before_save :encrypt_password

	validates :name, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
  
	attr_accessor :password
	before_save :encrypt_password

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	  		user
		else
	  		nil
		end
	end

	def encrypt_password
		if password.present?
	  		self.password_salt = BCrypt::Engine.generate_salt
	  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def fullname
		name + " " + lastname
	end

end
