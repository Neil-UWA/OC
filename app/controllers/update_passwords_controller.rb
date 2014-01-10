class UpdatePasswordsController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attribute(:password, params[:user][:password])
			redirect_to signin_path, notice: "Password has been updated, please login again" and sign_out
		else
			render "edit"
		end 
	end
end
