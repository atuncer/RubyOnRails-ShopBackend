class Item < ApplicationRecord
  belongs_to :shop

  has_many :favorite_items
  has_many :item_favorited_by, through: :favorite_items, source: :user
end
