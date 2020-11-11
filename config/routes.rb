Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # we want to see multiple products

      resources :products

        resources :product_variants do
          resources :order_items
    end

    # stripe payments
    resources :payment_intents
    resources :webhooks, only: [:create]


  # we want a user to only have one cart
  resource :cart

   # we want our users to order multiple times
  resources :orders


  root "products#index"

end
