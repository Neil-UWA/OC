class PasswordsController < ApplicationController
  def new
  end

	def create
		@user = User.find_by_email(params[:password][:email])
		if @user 
			@user.send_password_reset
			flash[:success] = "Check your email"
			redirect_to root_path
		else
			flash[:notice] = "The email is not valid or doesn't exits"
			render "new"
		end
	end

	def edit
		@user = User.find_by_password_reset_token!(params[:id])	
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		if @user.password_reset_sent_at < 0.5.hours.ago
			redirect_to root_path, notice: "Password reset session expired"
		elsif @user.update_attribute(:password, params[:user][:password])
			redirect_to root_path, success: "Password has been reset"
		else
			render :edit
		end
	end
end
