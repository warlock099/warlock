class OrdersController < ApplicationController



  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end

  def create
    @order = Order.new(form_params)
    @order.add_from_cart(@current_cart)
  end


  def confirm
  @order = Order.new(form_params) # GET THE POST parameters
  @order.add_from_cart(@current_cart)
  render :new if @order.invalid? # Return if false
end




private

  def form_params
  params.require(:order).permit(:first_name, :last_name, :email,
    :country, :address_1, :address_2, :city, :postal_code, :stripe_payment_intent)
  end


end
