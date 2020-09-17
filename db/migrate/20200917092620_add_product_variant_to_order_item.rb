class AddProductVariantToOrderItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :product_variant_id, :integer
  end
end
