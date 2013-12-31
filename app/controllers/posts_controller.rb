# TODO 
#		1. need to enbale multiple categories

class PostsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@posts = @user.posts 
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.create(params[:post].permit(:title, :content))

		redirect_to user_posts_path(@user), notice: "Successfull created a post"
	end

	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
		@categories = @post.categories
	end
	
	def update
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])		

		if @post.update(params[:post].permit(:title, :content))
			redirect_to user_posts_path(@user) 
		end
	end
end
