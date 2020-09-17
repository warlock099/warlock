class ProductVariant < ApplicationRecord


  belongs_to :product
  has_one :selected_variant
  has_many :order_items


  def price_in_dollars
   price / 100
 end

end
