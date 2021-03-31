class AddSlugToNfts < ActiveRecord::Migration[6.0]
  def change
    add_column :nfts, :slug, :string
    add_index :nfts, :slug, unique: true
  end
end
