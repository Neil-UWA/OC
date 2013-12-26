class User < ActiveRecord::Base
	has_secure_password 

	validates :name, :email, :password, presence: true 
	validates :password, length: {minimum:6},
                       confirmation: true
end
