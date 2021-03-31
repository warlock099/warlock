class Nft < ApplicationRecord


    mount_uploader :image, ProductImageUploader

    extend FriendlyId
    friendly_id :title, use: :slugged

    validates :title, presence: true
    validates :date, presence: true
    validates :description, presence: true
    validates :image, presence: true
    validates :link, presence: true

end
