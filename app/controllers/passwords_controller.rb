class PasswordsController < ApplicationController
  def new
  end

	def create
		if User.find_by_email( params[:password][:email])
			PasswordMailer.reset_password_email(params[:password].permit(:email)).deliver
			flash.now[:success] = "Check your email"
		else
			flash.now[:notice] = "The email is not valid or doesn't exits"
		end
		render "new"
	end
end
