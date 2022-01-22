class AddSyncVariantIdToProductVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :product_variants, :sync_variant_id, :integer
  end
end
