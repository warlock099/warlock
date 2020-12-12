class ApplicationController < ActionController::Base

  # before we do anything on the site, we have a cart (run the current_cart)
  before_action :current_cart

  # gives current_cart access to our 'views' .. to our html
  helper_method :current_cart

  def money
    "$"
  end

  def current_cart



    # if the customer has just landed on the site, give them a brand new cart
    # if they already have a cart...keep it
    # check session[:cart_id]

    if session[:cart_id].present?
      # they already have a cart
      @current_cart = Cart.find(session[:cart_id])
    else

     # they don't have a cart
      @current_cart = Cart.create
      # letting the user know that they now have cart, "we are putting in into there hands"
      session[:cart_id] = @current_cart.id
    end
  end

end
