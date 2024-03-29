class OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])

    render :layout => "thankyou"
  end

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end

  def create

    # create is the action that creates info to the database

    @order = Order.new(form_params)
    @order.add_from_cart(@current_cart)

    Order.post_printful_order(@order)



    if @order.save


    OrderConfirmationMailer.Confirmation(@order).deliver_now
    OrderConfirmationMailer.newOrder(@order).deliver_now



      reset_session


      flash[:success] = "Order completed"


      redirect_to order_path(@order)
    else
      render "new"
    end
  end





private

  def form_params
  params.require(:order).permit(:first_name, :last_name, :email,
    :country, :address_1, :address_2, :city, :state, :postal_code, :stripe_payment_id)
  end


end
