class AddIsPrintToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :is_print, :boolean
  end
end
