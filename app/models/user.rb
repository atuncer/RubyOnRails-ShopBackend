class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # I can't get this to work
  # A user can still create multiple shops
  has_one :shop, dependent: :destroy

  has_many :favorite_shops, dependent: :destroy
  has_many :shop_favorites, through: :favorite_shops, source: :shop

  has_many :favorite_items, dependent: :destroy
  has_many :item_favorites, through: :favorite_items, source: :item

end
