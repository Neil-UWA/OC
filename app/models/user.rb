class User < ActiveRecord::Base
	# Relationships between users
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed

	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followers, through: :reverse_relationships, source: :follower

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy 
	has_many :posts, dependent: :destroy

	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_secure_password

	#email validation regular expression
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 
						:email,  
						:password, presence: true 

	validates :email, format: { with:email_regex }, uniqueness: { case_sensitive:false }

	validates :password, length: { minimum:6 }

	def create_password_reset_token
		self.update_attribute(:password_reset_token, User.encrypt(User.new_remember_token))
		self.update_attribute(:password_reset_sent_at ,Time.zone.now)
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64	
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def following?(other_user)
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def same_user(other_user)
		self == other_user
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user).destroy!
	end

	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
