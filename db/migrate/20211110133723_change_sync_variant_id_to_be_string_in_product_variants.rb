class ChangeSyncVariantIdToBeStringInProductVariants < ActiveRecord::Migration[6.0]
  def change
    change_column :product_variants, :sync_variant_id, :string
  end
end
