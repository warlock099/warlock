class Product < ApplicationRecord

   attr_accessor :product_variant_id


  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :description, presence: true
  validates :cover_image, presence: true

  has_many :product_variants, dependent: :destroy

  has_many :order_items


  mount_uploader :cover_image, ProductImageUploader
  mount_uploader :image_1, ProductImageUploader
  mount_uploader :image_2, ProductImageUploader
  mount_uploader :image_3, ProductImageUploader





    Product.find_each do |product|
      product.cover_image.recreate_versions! if product.cover_image?
    end


  def total_quantity

    @count = 0

    @order.order_items.all.each do |item|
      @count = @count + item.quantity
    end
    @count
  end

  def total_price
    @total = 0

  @order.order_items.all.each do |item|
  @total = @total + item.product_variant.price * item.quantity
  end
    @total
  end

  def total_price_in_dollars

  @total = 0

  @order.order_items.all.each do |item|
    @total = @total + item.product_variant.price_in_dollars * item.quantity
  end

  @total
  end


end
