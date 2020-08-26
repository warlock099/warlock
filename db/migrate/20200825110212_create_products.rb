class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :cover_image
      t.text :description
      t.integer :price
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.boolean :is_sold_out, default: false

      t.timestamps
    end
  end
end
