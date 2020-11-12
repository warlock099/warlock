class PaymentIntentsController < ApplicationController

  before_action :set_order

  def create


  # Create a payment intent with the expected amount,
  payment_intent = Stripe::PaymentIntent.create(
    amount: @order.total_price * 100,
    currency: 'usd',
    description: "Order for ",
    statement_descriptor: 'Warlock order',
  )
  # return the client secret
  render json: {
    id: payment_intent.id,
    client_secret: payment_intent.client_secret
  }


  end




  private

   def set_order
       @order = Order.find_by(params[:order_id])
   end

end
