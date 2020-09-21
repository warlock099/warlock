class OrderItemsController < ApplicationController


  def create


# find the product_variant
@product_variant = ProductVariant.find(params[:product_variant_id])

# quantity? - comes from the form data
@quantity = form_params[:quantity]

@order_item = @current_cart.order_items.new(form_params)

@order_item.save

flash[:success] = "Thanks for adding to your cart"

redirect_to cart_path

end

def update


@product_variant = ProductVariant.find(params[:product_variant_id])

@order_item = OrderItem.find(params[:id])

@order_item.update(form_params)

flash[:success] = "Thanks for updating your cart"

redirect_to cart_path
end

def destroy

@product_variant = ProductVariant.find(params[:product_variant_id])
@order_item = OrderItem.find(params[:id])

@order_item.delete

flash[:success] = "Product removed from cart"

redirect_to cart_path
end


def form_params
params.require(:order_item).permit(:quantity, :product_variant_id, :product_id)
end



end
