class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :user_has_shop?, only: %i[new create]
  before_action :user_is_owner?, only: %i[edit update destroy]
  # GET /items or /items.json

  def add_to_favorite
    type = params[:type]
    id = params[:id]
    @item = Item.find(id)
    case type
    when 'favorite'
      if !current_user.item_favorites.include?(@item)
        current_user.item_favorites << @item
        render json: { message: 'Item added to favorites' }
      else
        render json: { message: 'Item already in favorites' }
      end

    when 'unfavorite'
      if current_user.item_favorites.include?(@item)
        current_user.item_favorites.delete(@item)
        render json: { message: 'Item unfavorited' }
      else
        ender json: { message: 'Item was already unfavorited' }
      end

    else
      # type code here
    end
  end

  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(permitted_item_params)
    @item.shop_id = current_user.shop.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(permitted_item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def auth_to_create_shop?
    current_user.role
  end

  def can_create_new_shop?
    # Has auth to create shop and has no shop
    current_user.role && !current_user.shop.present?
  end

  helper_method :can_user_edit_item
  def can_user_edit_item(item_shop_id)
    current_user.present? && current_user.shop.present? && current_user.shop.id == item_shop_id

  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def user_has_shop?
    if !auth_to_create_shop?
      redirect_to root_path, alert: 'You are plain user.'
    elsif can_create_new_shop?
      redirect_to new_shop_path, alert: 'You should create a shop first.'
    else
      return true
    end
    false
  end

  def user_is_owner?
    if !auth_to_create_shop? && can_create_new_shop? && user_has_shop? && !can_user_edit_item(@item.shop_id)
      redirect_to items_path, alert: 'You are not authorized to edit this item.'
    else
      return true
    end
    false
  end
  # Only allow a list of trusted parameters through.
  def item_params
    params.fetch(:item, {})
  end

  def permitted_item_params
    params.require(:item).permit(:name, :stock, :description)
  end
end
