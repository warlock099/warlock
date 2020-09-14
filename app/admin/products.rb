ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :cover_image, :description, :price, :image_1, :image_2, :image_3, :is_sold_out


  index do
    selectable_column
    index_column
    column "Cover Image" do |product|
      image_tag product.cover_image.thumb.url
    end
    column :id
    column :title
    column :description
    column :price
    column :is_sold_out
    column :product_variants
    actions
  end

end
