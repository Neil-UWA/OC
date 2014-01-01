class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name:params[:sessions][:name])

		if user && user.authenticate(params[:sessions][:password])
			sign_in user
			redirect_to user_path(user)	
		else
			flash.now[:notice] = "Invalid Username/ Password"
			render "new"
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
