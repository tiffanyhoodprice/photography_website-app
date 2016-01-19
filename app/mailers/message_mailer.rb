class MessageMailer < ApplicationMailer

default :to => "tiffany.hood@mail.com"

  def send_message(params)
   
    @name = params["name"]
    @email = params["email"]
    @content = params["content"]
   
    mail(to: 'tiffany.hood@mail.com', from: 'tiffany.hood@mail.com', subject: "Contact Form", cc: @email)
  end

end
