class CreateNfts < ActiveRecord::Migration[6.0]
  def change
    create_table :nfts do |t|
      t.string :title
      t.string :image
      t.string :date
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
