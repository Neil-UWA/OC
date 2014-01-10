class PasswordsController < ApplicationController
  def new
  end

	def create
		@user = User.find_by_email(params[:password][:email])
		if @user 
			@user.create_password_reset_token
			PasswordMailer.reset_password_email(@user).deliver
			redirect_to root_path, notice: "Check your email"
		else
			flash.now[:alert] = "The email is not valid or doesn't exits"
			render "new"
		end
	end

	def edit
		redirect_to root_path, alert:"the link has expired" unless @user = User.find_by_password_reset_token(params[:id])	
	end

	def update
		@user = User.find_by_password_reset_token!(params[:id])
		
		if @user.password_reset_sent_at < 0.5.hours.ago
			redirect_to root_path, alert: "Password reset session expired"
		elsif @user.update_attribute(:password, params[:user][:password])
			redirect_to root_path, notice: "Password has been reset"
			@user.create_password_reset_token
		else
			render :edit
		end
	end
end
