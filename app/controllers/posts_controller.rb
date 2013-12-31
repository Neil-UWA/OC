# TODO 
#		1. need to enbale multiple categories

class PostsController < ApplicationController
	# list all the posts belong to a specific user
	def index
		@user = User.find(params[:user_id])
		@posts = @user.posts 
	end

	# create a new post for a specifi user
	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	# save the created post into database,
	# including its categories
	#
	def create
		@user = User.find(params[:user_id])

		@post = @user.posts.build(params[:post].permit(:title, :content))
		@category = @post.categories.build(params[:category].permit(:category))

		if @post && @category
			@post.save
			@category.save

			flash.now[:success] = "A post has been created"
		else	
			flash.now[:error] = "Post failed"
		end

		redirect_to user_posts_path(@user)  
	end

	# edit a post, including its category
	def edit
		@user = User.find(params[:user_id])
		@post = @user.posts.find(params[:id])
		@categories = @post.categories
	end
	
	# udpate a post and its category
	def update
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])		

		if @post.update(params[:post].permit(:title, :content))
			redirect_to user_posts_path(@user) 
		end
	end
end
