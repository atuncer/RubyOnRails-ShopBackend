class FavoriteItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]

  # GET /favorite_items or /favorite_items.json
  def index
    @favorite_items = FavoriteItem.where(user_id: current_user.id)
  end


end
