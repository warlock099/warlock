class Order < ApplicationRecord

  require 'json'
  require 'httparty'


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


def self.post_printful_order

  require 'json'
  require 'httparty'


  HTTParty.post("https://api.printful.com/orders",
    :body => {
        "recipient": {
            "name": "Bob",
            "address1": "Dole",
            "city": "Cheshire",
            "state_code": "CT",
            "country_code": "US",
            "zip": "06410"
        },
        "items": [
            {
                "sync_variant_id": 2877024224,
                "quantity": 1,
                "files": [
                    {
                        "url": "http://example.com/files/posters/poster_1.jpg"
                    }
                ]
            }
        ]
    }.to_json,
    :headers => { 'Content-Type' => 'application/json', 'API key' => Rails.application.credentials[Rails.env.to_sym][:printful_key] } )

    # begin
    #     uri = URI.parse('https://api.printful.com/orders')
    #     req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json',
    #       'API key' => 'bbnoyvq9-ku2j-xyn6:nael-d0xx78lfzixp'})
    #     req.body = {
    #     "recipient": {
    #         "name": "Bob",
    #         "address1": "Dole",
    #         "city": "Cheshire",
    #         "state_code": "CT",
    #         "country_code": "US",
    #         "zip": "06410"
    #     },
    #     "items": [
    #         {
    #             "sync_variant_id": 2877024224,
    #             "quantity": 1,
    #             "files": [
    #                 {
    #                     "url": "http://example.com/files/posters/poster_1.jpg"
    #                 }
    #             ]
    #         }
    #     ]
    # }.to_json
    #     res = http.request(req)
    #     puts "response #{res.body}"
    #     puts JSON.parse(res.body)
    # rescue => e
    #     puts "failed #{e}"
    # end
    puts "post request fired"
  end

end
