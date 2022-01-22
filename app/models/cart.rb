class Cart < ApplicationRecord

  has_many :order_items

  def total_quantity

    @count = 0

    order_items.all.each do |item|
      @count = @count + item.quantity.to_i
    end
    @count
  end

  def total_price
    @total = 0

  order_items.all.each do |item|
  @total = @total + item.product_variant.price * item.quantity.to_i
  end
    @total
  end

  def total_price_in_dollars

  @total = 0

  order_items.all.each do |item|
    @total = @total + item.product_variant.price_in_dollars * item.quantity.to_i
  end

  @total
  end

end
