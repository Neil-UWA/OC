class PostsController < ApplicationController
	before_action :signed_in_user, except: [:index, :show]

	def index
		@posts = Post.paginate(page: params[:page], per_page:10)
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.build(params[:post].permit(:title, :content))
		@category = @post.categories.build(params[:category].permit(:category))

		if @post.save and @category.save
			flash.now[:success] =  "Successfull created a post"
			redirect_to user_posts_path(@user) 
		else 
			flash.now[:notice]= "Title or Content can not be empty"	
			render "new"
		end 
	end

	def show
		@likes = 0
		@dislikes = 0

		@post = Post.find(params[:id])	

		@post.likes.each do |vote|
			if vote.like == true
				@likes += 1
			else
				@dislikes += 1	
			end
		end	
	end

	def edit
		@post = Post.find(params[:id]) 
	end

	def update
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])		

		redirect_to user_posts_path(@user) if @post.update(params[:post].permit(:title, :content)) 
	end

end
