ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :cover_image, :description, :image_1, :image_2, :image_3, :is_sold_out, :slug


  index do
    selectable_column
    index_column
    column "Design" do |product|
      image_tag product.cover_image.thumb.url
    end
    column "Product ID #" do |product|
      product.id
    end
    column :title
    column :description
    column :is_sold_out
    column "Product variants" do |product|
      product.product_variants.each do |product_variant|
      end
  end
    actions
  end

end
