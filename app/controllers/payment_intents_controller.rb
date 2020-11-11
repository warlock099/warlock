class PaymentIntentsController < ApplicationController

  def create


      def total_price
       @total = 0

       @order.order_items.each do |item|
         @total = @total + item.product_variant.price_in_dollars * item.quantity
       end

       @total.to_i
     end


     def total_price_in_dollars
       @total = 0

       @order.order_items.all.each do |item|
         @total = @total + item.product_variant.price_in_dollars * item.quantity
       end

       @total.to_i
     end


  # Create a payment intent with the expected amount,
  payment_intent = Stripe::PaymentIntent.create(
    amount: params[:order].total_price * 100,
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
end
