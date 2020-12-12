class OrderConfirmationMailer < ApplicationMailer

  def Confirmation(order)
    # we want to use @user in our views
    @order = order

    mail to: @order.email, subject: "Thanks for your order!"
  end

  def newOrder(order)
    @order = order

    mail to: "lol@warlockenterprises.com", subject: "New order!"
  end

end
