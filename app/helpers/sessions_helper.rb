module SessionsHelper
	def sign_in(user)
		remember_token = User.new_remember_token
	
		# store the remember_token in the cookies forever, almost 20 years
		cookies.permanent[:remember_token] = remember_token

		# update the user's remember_token when sign in
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user	
	end

	def current_user

		# retrieve the remember_token from the cookies
		# and use it to find the correspond user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def signed_in?
		!current_user.nil?	
	end

	def sign_out
		# update the remember_token, so that even someone got the 
		# previous token, one still couldn't access it
		current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
	
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
