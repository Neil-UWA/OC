class UsersController < ApplicationController
	before_action :signed_in_user, except:[:new, :create]

	def new
		@user = User.new	
	end

	def create
		@user = User.new(post_params)
		if @user.save
			sign_in @user
			redirect_to posts_path, sucess: "You have been registered to our service"
		else 
			render "new"
		end 
	end
	
	def show
		@user = User.find(params[:id]) 
		@comments = @user.comments

		redirect_to root_path unless @user
	end

	private
		def post_params
			params[:user].permit(:name, :email, :password, :password_confirmation)	
		end
end
