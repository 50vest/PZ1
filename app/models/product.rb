class Product < ApplicationRecord
    belongs_to :user
    mount_uploader :avatar, AvatarUploader
    has_many :orderables
    has_many :carts, through: :orderables
end
