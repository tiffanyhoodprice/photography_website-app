class UserMailer < ApplicationMailer

  def welcome_client(user, password)
    @user = user
    @password = password
    @url  = 'http://www.tiffanypricephotography.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Tiffany Price Photography')
  end

  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: email, to: 'tiffany.hood@mail.com', subject: 'New Contact Message from Tiffany Price Photography')
  end

end
