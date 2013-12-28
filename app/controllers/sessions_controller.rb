class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name:params[:sessions][:name])

		if user && user.authenticate(params[:sessions][:password])
			redirect_to user_path(user)	
		else
			flash[:error] = "Invalid username/ Password"
			render "new"
		end
	end

	def destroy
		
	end
end
