module UsersHelper
	def signed_in_user
		redirect_to root_path, alert: "Please sign in first" unless signed_in?
	end
end
