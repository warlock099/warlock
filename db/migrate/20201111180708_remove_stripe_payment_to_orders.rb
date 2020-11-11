class RemoveStripePaymentToOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :string, :stripe_payment_intent
  end
end
