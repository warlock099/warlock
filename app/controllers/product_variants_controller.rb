class ProductVariantsController < ApplicationController


  def index
    @product_variants = Product_Variant.all
  end

  def new
    @product_variant = Product_Variant.new
  end

  def create
    @product_variant = Product_Variant.new(form_params)
    @product_variant.save
  end

  def show
    @product_variant = Product_Variant.find(params[:id])

    # if the product is already in the cart
   @order_item = @current_cart.order_items.find(product_variant: @product_variant)

   if @order_item.nil?
     # if it doesn't exist in the cart
     @order_item = @current_cart.order_items.new(product_variant: @product_variant, quantity: 1)
   end
  end

  def edit
  end

  def update
    render "edit"
  end

  def destroy
  end


  def form_params
    Params.require(:product_variant).permit(:item, :size, :color, :price, :cover_image, :sync_variant_id, :printfile_url)
  end

end
