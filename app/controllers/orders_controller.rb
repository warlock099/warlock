class OrdersController < ApplicationController

  require 'json'
  include HTTParty

  def show
    @order = Order.find(params[:id])

    render :layout => "thankyou"
  end

  def new
    @order = Order.new
    @order.add_from_cart(@current_cart)
  end

  def create


      require 'json'
      require 'httparty'

    # create is the action that creates info to the database

    @order = Order.new(form_params)
    @order.add_from_cart(@current_cart)

    @post_fulfill = HTTParty.post("https://api.printful.com/orders",
      :headers => { 'Content-Type' => 'application/json', 'Authorization': Rails.application.credentials[Rails.env.to_sym][:printful_key]},
      :body => {
          "recipient": {
              "name": "Bob",
              "address1": "Dole",
              "city": "Cheshire",
              "state_code": "CT",
              "country_code": "US",
              "zip": "06410"
          },
          "items": [
              {
                  "sync_variant_id": 2877024224,
                  "quantity": 1,
                  "files": [
                      {
                          "url": "http://example.com/files/posters/poster_1.jpg"
                      }
                  ]
              }
          ]
      }.to_json)


      @post_fulfill




    if @order.save



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
