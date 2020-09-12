class CreateProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_variants do |t|
      t.string :item
      t.string :size
      t.string :color
      t.integer :price
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
