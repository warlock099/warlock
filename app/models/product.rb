class Product < ApplicationRecord


  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :cover_image, presence: true

  has_many :product_variants
  has_many :order_items, through: :product_variants


  mount_uploader :cover_image, ProductImageUploader
  mount_uploader :image_1, ProductImageUploader
  mount_uploader :image_2, ProductImageUploader
  mount_uploader :image_3, ProductImageUploader


end
