class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, 
						:email, 
						:password, presence: true 

	validates :email, format: {with:email_regex}

	validates :password, length: {minimum:6}

end
