class UserMailer < ApplicationMailer

  def welcome_client(user, password)
    @user = user
    @password = password
    @url  = 'http://www.tiffanypricephotography.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Tiffany Price Photography')
  end

end
