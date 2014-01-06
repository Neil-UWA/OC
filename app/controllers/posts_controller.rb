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

		# see whether the category exists
		@category = Category.find_by_category(params[:category][:category])

		# if the category doesnt exits, create a new one
		if @category.nil?
			@category = Category.new(category_params)
		end
		
		if PostCategory.create(post:@post, category:@category)
			redirect_to @post
		end 
	end

	def show
		@likes = 0		 # how many people like this post
		@dislikes = 0  # how many people disliek this post

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
		params[:category].permit(:category)
	end
end
