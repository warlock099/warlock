class OrderConfirmationMailer < ApplicationMailer

  def Confirmation(order)
    # we want to use @user in our views
    @order = order

    mail to: @order.email, subject: "Thanks for your order!"
  end

  def newOrder(order)
    @order = order

    mail to: "azback5@gmail.com", subject: "New order!"
  end

end
