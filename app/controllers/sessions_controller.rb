class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email:params[:sessions][:email])

		if @user && @user.authenticate(params[:sessions][:password])
			sign_in @user
			redirect_to posts_path 
		else
			flash.now[:alert] = "Invalid Account / Password"
			render "new"
		end
	end

	def destroy
		sign_out and redirect_to root_path
	end
end
