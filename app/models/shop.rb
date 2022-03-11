class Shop < ApplicationRecord
  validates :name, :bio, presence: true

  # Relationships
  belongs_to :user
  has_many :items, dependent: :destroy

  has_many :favorite_shops, dependent: :destroy
  has_many :shop_favorited_by, through: :favorite_shops, source: :user


end
