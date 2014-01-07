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
		@post = @user.posts.build(post_params)

		if category_params != ""
			@categories = category_params.split(",")

			@categories.each do |category|
				@category = Category.find_by_category(category)

				if @category.nil?
					@category = Category.new(category:category)
				end

				if !PostCategory.create(post:@post, category:@category)
					flash.now[:notice] = "Title / Content can not be empty"
					render "new"
					return 
				end
			end 
		else
			if !@post.save
				flash.now[:notice] = "Title / Content can not be empty"
				render "new"
				return 
			end
		end

		flash.now[:success] = "Successfully created a post"
		redirect_to @post
	end

	def show
		@likes, @dislikes = 0, 0 

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

	private
	def post_params
		params[:post].permit(:title, :content)
	end
	def category_params
		params[:category][:category]
	end
end
