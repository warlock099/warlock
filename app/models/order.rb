class Order < ApplicationRecord


  has_many :order_items


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true


  accepts_nested_attributes_for :order_items

  def add_from_cart(cart)
  cart.order_items.all.each do |item|
    self.order_items.build(product_variant: item.product_variant, quantity: item.quantity)
  end
end


def total_price
 @total = 0

 self.order_items.each do |item|
   @total = @total + item.product_variant.price_in_dollars * item.quantity
 end

 @total.to_i
end


def total_price_in_dollars
 @total = 0

 self.order_items.all.each do |item|
   @total = @total + item.product_variant.price_in_dollars * item.quantity
 end

 @total.to_i
end


def self.post_printful_order(order)

  require 'json'
  require 'httparty'


  HTTParty.post("https://api.printful.com/orders",
    :body => {
        "recipient": {
            "name": "#{order.first_name} #{order.last_name}",
            "address1": order.address_1,
            "city": order.city,
            "state_code": order.state,
            "country_code": order.country,
            "zip": order.postal_code
        },
        "items": order.order_items.map{ |item|
          {
              "sync_variant_id": item.product_variant.sync_variant_id.to_i,
              "quantity": item.quantity,
              "files": [ { "url": item.product_variant.printfile_url } ]
            }
          }
    }.to_json,
    :headers => { 'Content-Type' => 'application/json', 'Authorization' => Rails.application.credentials[Rails.env.to_sym][:printful_key] } )
  end

end
