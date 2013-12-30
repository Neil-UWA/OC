class PostsController < ApplicationController
	def create

		#find the user first, according to the passed in user_id
		@user = User.find(params[:user_id])

		#create a post and save it
		#need to do error handling here
		@post = @user.posts.create(params[:post].permit(:title, :content))
		redirect_to @user 
	end
end
