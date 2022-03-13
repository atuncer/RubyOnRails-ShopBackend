class Item < ApplicationRecord
  validates :name, :stock, :description, presence: true
  belongs_to :shop

  has_many :favorite_items, dependent: :destroy
  has_many :item_favorited_by, through: :favorite_items, source: :user
end
