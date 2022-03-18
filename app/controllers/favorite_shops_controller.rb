class FavoriteShopsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  # GET /favorite_shops or /favorite_shops.json
  def index
    @favorite_shops = FavoriteShop.where(user_id: current_user.id)
  end
end
