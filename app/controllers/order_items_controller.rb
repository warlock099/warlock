class OrderItemsController < ApplicationController


  def create

@product = Product.friendly.find(params[:product_id])

# find the product_variant
@product_variant = ProductVariant.find(params[:product_variant_id])

# quantity? - comes from the form data
@quantity = form_params[:quantity]

@current_cart.order_items.create(product: @product, product_variant: @product_variant, quantity: @quantity)

flash[:success] = "Thanks for adding to your cart"

  redirect_to product_path(@product)

end

def update

@product = Product.friendly.find(params[:product_id])

@product_variant = ProductVariant.find(params[:product_variant_id])

@order_item = OrderItem.find(params[:id])

@order_item.update(form_params)

flash[:success] = "Thanks for updating your cart"

redirect_to cart_path
end

def destroy
@product = Product.friendly.find(params[:product_id])
@product_variant = ProductVariant.find(params[:product_variant_id])
@order_item = OrderItem.find(params[:id])

@order_item.delete

flash[:success] = "Product removed from cart"

redirect_to cart_path
end


def form_params
params.require(:order_item).permit(:quantity)
end



end
