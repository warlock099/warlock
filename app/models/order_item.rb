class OrderItem < ApplicationRecord

  belongs_to :order, optional: true
  belongs_to :cart, optional: true
  belongs_to :product_variant


  accepts_nested_attributes_for :product_variant




end
