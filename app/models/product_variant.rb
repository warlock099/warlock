class ProductVariant < ApplicationRecord


  has_many :order_items, dependent: :destroy

  def name_of_method
    "#{item} / #{color} / #{size} / $#{price_in_dollars}"
  end

  validates :item, presence: true
  validates :price, presence: true

  def price_in_dollars
   price / 100
  end


end
