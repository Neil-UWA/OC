class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment][:comment])
		@comment.user = current_user

		# TODO 
		# error handling is needed here
		@comment.save

		redirect_to @post
  end
end
