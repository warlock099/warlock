class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.belongs_to :product_variant, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
