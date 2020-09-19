class RemoveProductIdFromOrderItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :order_items, :product_id, :integer
  end
end
