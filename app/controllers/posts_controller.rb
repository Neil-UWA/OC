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
			create_categories(@post, category_params)
		elsif !@post.save
			flash.now[:notice] = "Title / Content can not be empty"
			render "new"
			return 
		end

		redirect_to @post, succes: "Successfully created a post"
	end

	def show
		@post = Post.find(params[:id])	
		@likes = @post.likes.where(like: true).count
		@dislikes = @post.likes.where(like: false).count
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

	def create_categories(post, categories)
		@categories = categories.split(",")

		@categories.each do |category|
			@category = Category.find_by_category(category)

			@category = Category.new(category:category) if @category.nil?

			if !PostCategory.create(post:post, category:@category)
				flash.now[:notice] = "Title / Content can not be empty"
				render "new"
				return 
			end
		end 
	end
end
