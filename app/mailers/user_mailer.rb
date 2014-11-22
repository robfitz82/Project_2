class UserMailer < ActionMailer::Base
  default from: "jaduffy108+info@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user, root_url_str)
    @user = user
    @url  = root_url_str + "login"
    mail(to: @user.email, subject: 'Sign Up Confirmation')
  end

def forgot_password_email(user, root_url_str)
    @user = user
    @url  = root_url_str +'reset/'+ user.reset_token
    mail(to: @user.username, subject: 'Reset your password')
  end

end