class PasswordsController < ApplicationController
  def new
  end

	def create
		if User.find_by_email( params[:password][:email])
			PasswordMailer.reset_password_email(params[:password][:email]).deliver
			flash.now[:success] = "Check your email to reset your password"
      redirect_to root_path
		else
			flash.now[:notice] = "The email is not valid or doesn't exits"
      render "new"
		end
	end
  
  def edit
  end
  def update
    
  end
end
