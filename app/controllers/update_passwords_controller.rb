class UpdatePasswordsController < ApplicationController
	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user].permit(:password, :password_confirmation))
			sign_out
			redirect_to signin_path, notice: "Password has been updated, please login again" 
		else
			render "edit"
		end 
	end
end
