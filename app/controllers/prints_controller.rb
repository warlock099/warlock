class PrintsController < ApplicationController

  def index
    @products = Product.all
  end

  def show

    @product = Product.friendly.find(params[:id])
    @product_variant = @product.product_variants.find_by(params[:product_variant_id])

      # if the product is already in the cart
   @order_item = @current_cart.order_items.find_by(product_variant: @product_variant)

   if @order_item.nil?
     # if it doesn't exist in the cart
     @order_item = @current_cart.order_items.new(product_variant: @product_variant, quantity: 1)
   end
  end




  def product_params
    Params.require(:product).permit(:title, :description, :is_print, :cover_image, :image_1, :image_2, :image_3 )
  end

end
