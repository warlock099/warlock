ActiveAdmin.register ProductVariant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :item, :size, :color, :price, :product_id, :title


  form do |f|
   inputs 'Details' do
     f.semantic_errors
     f.input :color, as: :text
     f.input :item
     f.input :price
     f.input :size
   end

   f.actions
 end

 index do
   selectable_column
   index_column
   column "Design" do |product_variant|
     image_tag product_variant.product.cover_image.thumb.url
   end
   column "Product" do |product_variant|
     product_variant.product.title
   end
   column "Product ID #" do |product_variant|
     product_variant.product_id
   end
   column :item
   column :size
   column :color
   column :price
   actions
 end

 show do
     attributes_table do
       row "Product" do |product_variant|
         product_variant.product.title
       end
       row :item
       row :size
       row :color
       row :price
     end
   end

end
