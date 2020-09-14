class CreateSelectedVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :selected_variants do |t|
      t.belongs_to :product_variant, null: false, foreign_key: true
      t.belongs_to :order_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
