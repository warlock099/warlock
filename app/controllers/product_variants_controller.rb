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
    @product_variant = @Product.product_variants.find_by(params[:id])
  end

  def destroy
  end 


  def form_params
    Params.require(:product_variant).permit(:item, :size, :color, :price)
  end

end
