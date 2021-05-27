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
     f.input :product_id
   end

   f.actions
 end



end
