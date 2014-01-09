class UpdatePasswordsController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attribute(:password, params[:user][:password])
			flash[:success] = "Password has been updated, please login again"
			redirect_to root_path
			sign_out
		else
			render "edit"
		end 
	end
end
