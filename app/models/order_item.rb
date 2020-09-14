class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :cart
  belongs_to :selected_variants
end
