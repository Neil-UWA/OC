class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_secure_password

	#emial validation regular expression
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 
						:email,  
						:password_confirmation,
						:password, presence: true 

	validates :email, format: { with:email_regex }, uniqueness: { case_sensitive:false }

	validates :password, length: { minimum:6 }, confirmation: true

end
