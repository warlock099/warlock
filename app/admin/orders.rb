ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :email, :address_1, :address_2, :city, :postal_code, :country, :stripe_payment_id


  index do
    selectable_column
    index_column
    column "$ Amount" do |order|
      order.total_price_in_dollars
    end
    column :address_1
    column :address_2
    column :city
    column :postal_code
    column :country
    column :last_name
    column :first_name
    actions
  end

  show do
      attributes_table do
        row "Order ID #" do |order|
          order.id
        end
        row "Order Items" do |order|
          order.order_items
        end
        row "Total Amount ($)" do |order|
          order.total_price_in_dollars
        end
      end
    end

end
