class ProductVariant < ApplicationRecord




  belongs_to :product
  has_many :order_items

  validates :item, presence: true



  def price_in_dollars
   price / 100
 end

end
