class AddPrintfileUrlToProductVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :printfile_url, :string
  end
end
