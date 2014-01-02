class User < ActiveRecord::Base
	has_many :comments
	has_many :posts, dependent: :destroy

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_secure_password

	#emial validation regular expression
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 
						:email,  
						:password_confirmation,
						:password, presence: true 

	validates :email, format: { with:email_regex }, uniqueness: { case_sensitive:false }

	validates :password, length: { minimum:6 }, confirmation: true

	# class method, dont have to initialize an object
	def User.new_remember_token
		SecureRandom.urlsafe_base64	
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
