class PaymentIntentsController < ApplicationController


  def create


  # Create a payment intent with the expected amount,
  payment_intent = Stripe::PaymentIntent.create(
    amount: @current_cart.total_price.to_i,
    currency: 'usd',
    description: "Order for ",
    statement_descriptor: 'Warlock order'
  )
  # return the client secret
  render json: {
    id: payment_intent.id,
    client_secret: payment_intent.client_secret
  }


  end

  def f_params
    params.permit(:first_name, :last_name, :email, :stripe_payment_id, :authenticity_token)
  end

end
