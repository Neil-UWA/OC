class PasswordsController < ApplicationController
  def new
  end

	def create
		@user = User.find_by_email(params[:password][:email])
		if @user 
			@user.send_password_reset
			flash.now[:success] = "Check your email"
			redirect_to root_path
		else
			flash.now[:notice] = "The email is not valid or doesn't exits"
			redirect_to "new"
		end
	end

	def edit
		@user = User.find_by_password_reset_token!(params[:id])	
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_sent_at < 0.5.hours.ago
			flash[:notice] = "Password reset session expired"
			redirect_to root_path
		elsif @user.update_attribute(:password, params[:user][:password])
			flash[:success] = "Password has been reset"
			redirect_to root_path
		else
			render :edit
		end
	end
end
