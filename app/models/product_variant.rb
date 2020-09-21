class ProductVariant < ApplicationRecord


  belongs_to :product
  has_many :order_items

  def name_of_method
    "#{item} / #{color} / #{size} / $#{price_in_dollars}"
  end

  validates :item, presence: true

  def price_in_dollars
   price / 100
  end


end
