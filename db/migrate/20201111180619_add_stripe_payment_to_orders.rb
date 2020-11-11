class AddStripePaymentToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :stripe_payment_intent, :string
  end
end
