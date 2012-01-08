class User < ActiveRecord::Base

	attr_accessible :activation_code, :email, :password, :password_confirmation, :name, :lastname, :active
	attr_accessor :password

	validates :name, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true, :uniqueness => true
	validates_confirmation_of :password
	validates_presence_of :password, :on => :create  

	before_save :encrypt_password
	before_create { generate_token(:auth_token) }

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt) && user.active
	  		user
		else
	  		nil
		end
	end

	def encrypt_password
		#self.activation_code = BCrypt::Engine.generate_salt
		o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
		self.activation_code = (0..50).map{ o[rand(o.length)]  }.join

		if password.present?
	  		self.password_salt = BCrypt::Engine.generate_salt
	  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end

	def fullname
		name + " " + lastname
	end
	
	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.password_reset(self).deliver
	end

end
