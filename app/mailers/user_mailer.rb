class UserMailer < ActionMailer::Base
  default from: "lvjinang@yahoo.com.au"

	def welcome_email(user)
		@user = user
		mail to: @user.email, subject: "welcome to use our services"
	end
end
