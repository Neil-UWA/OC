class PasswordMailer < ActionMailer::Base
  default from: "lujinang@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset_password_email.subject
  #
  def reset_password_email(email)
    @greeting = "Hi"
		@url = "localhost:3000/home"

    mail to: email, subject: "resetting your password" 
  end
end
