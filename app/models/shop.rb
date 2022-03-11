class Shop < ApplicationRecord
  belongs_to :user

  has_many :favorite_shops
  has_many :shop_favorited_by, through: :favorite_shops, source: :user


end
