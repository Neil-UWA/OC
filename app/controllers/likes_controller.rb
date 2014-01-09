class LikesController < ApplicationController
	before_action :signed_in_user, on: :create

	def create
		@post = Post.find(params[:post_id])

		@like = @post.likes.build(like: params[:status])
		@like.user = current_user

		redirect_to @post if @like.save
	end
end
