class LikesController < ApplicationController
	before_action :signed_in_user, on: :create

	def create
		@post = Post.find(params[:post_id])
		if params[:status] == 'true'
			@like = @post.likes.build(like:true)
		else
			@like = @post.likes.build(like:false)
		end

		@like.user = current_user
	
		if @like.save
			redirect_to @post
		end
	end
end
