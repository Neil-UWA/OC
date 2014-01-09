class PasswordMailer < ActionMailer::Base
  default from: "octesting@yahoo.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset_password_email.subject
  #
  def reset_password_email(email)
    @greeting = "Hi"

    mail to: email, subject: "resetting your password" 
  end
end
