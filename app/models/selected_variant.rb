class SelectedVariant < ApplicationRecord
  belongs_to :product_variant

  has_many :order_items


end
