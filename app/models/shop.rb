class Shop < ApplicationRecord
  validates :name, :bio, presence: true

  # Relationships
  belongs_to :user

  has_many :favorite_shops
  has_many :shop_favorited_by, through: :favorite_shops, source: :user


end
