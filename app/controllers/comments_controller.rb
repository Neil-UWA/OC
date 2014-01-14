class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment].permit(:comment))
		@comment.user = current_user

		respond_to do |format|
			if @comment.save
				format.html {redirect_to @post}
				format.js  
			end
		end 
  end
end
