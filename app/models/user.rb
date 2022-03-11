class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shop

  has_many :favorite_shops
  has_many :shop_favorites, through: :favorite_shops, source: :shop

  has_many :favorite_items
  has_many :item_favorites, through: :favorite_items, source: :item

end
