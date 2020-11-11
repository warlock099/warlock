class RenameStripePaymentIntentToStripePaymentId < ActiveRecord::Migration[6.0]
  def change
     rename_column :orders, :stripe_payment_intent, :stripe_payment_id
   end
end
