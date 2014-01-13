class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment].permit(:comment))
		@comment.user = current_user

		redirect_to @post if @comment.save
  end
end
