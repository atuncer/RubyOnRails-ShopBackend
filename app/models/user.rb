class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # I can't get this to work
  # TODO: fix users creating multiple shops. Done
  # so apparently, has_one doesn't validate users having only one shop
  # it makes shop singular and limits the query to 1
  # I added "validates :user_id, uniqueness: true" to the shop model
  has_one :shop, dependent: :destroy

  has_many :favorite_shops, dependent: :destroy
  has_many :shop_favorites, through: :favorite_shops, source: :shop

  has_many :favorite_items, dependent: :destroy
  has_many :item_favorites, through: :favorite_items, source: :item

end
