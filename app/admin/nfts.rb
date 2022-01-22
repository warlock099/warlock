ActiveAdmin.register Nft do


    permit_params :title, :image, :date, :description, :link, :slug

    index do
      selectable_column
      index_column
      column "Image" do |nft|
        image_tag nft.image.thumb.url
      end
      column :title
      column :date
      column :description
      column :link
      actions
    end


end
