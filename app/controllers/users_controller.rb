class UsersController < ApplicationController
	def index
		@users = User.all	
	end
	def new
		@user = User.new	
	end

	def create
		@user = User.new(post_params)
		if @user.save
			redirect_to @user
		else 
			render "new" 
		end 
	end
	
	def show
		@user = User.find(params[:id])	
	end

	private
		def post_params
			params[:user].permit(:name, :email, :password)	
		end
end
