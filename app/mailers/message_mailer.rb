class MessageMailer < ApplicationMailer

default :to => "tiffanypricephotography@gmail.com"

  def send_message(params)
   
    @name = params["name"]
    @email = params["email"]
    @content = params["content"]
   
    mail(to: 'tiffanypricephotography@gmail.com', from: 'tiffanypricephotography@gmail.com', subject: "Contact Form", cc: @email)
  end

end
