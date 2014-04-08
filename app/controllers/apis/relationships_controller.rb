class Api::RelationshipsController < ApplicationController
	def create
		@follower = current_user
		@user = User.find_by(id: params[:relationship][:followed_id])
		@followed_user = current_user.relationships.create(followed_id: params[:relationship][:followed_id])
		redirect_to @user
	end

	def destroy
		@user = Relationship.find(params[:id]).followed 
		current_user.unfollow!(@user)
		redirect_to @user
	end
end
