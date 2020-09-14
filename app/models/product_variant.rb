class ProductVariant < ApplicationRecord
  belongs_to :product

  has_one :selected_variant

end
