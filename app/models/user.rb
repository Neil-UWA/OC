class User < ActiveRecord::Base
	has_secure_password

	#emial validation regular expression
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 
						:email, 
						:password_confirmation,
						:password, presence: true 

	validates :email, format: {with:email_regex}

	validates :password, length: {minimum:6},
												confirmation: true

end
