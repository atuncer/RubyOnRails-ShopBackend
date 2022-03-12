class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  # GET /items or /items.json
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
    if @item.shop_id != current_user.shop.id  # TODO: I don't know about it yet
      redirect_to items_path, notice: 'You are not authorized to edit this item.'
    end
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
    if @item.shop_id != current_user.shop.id  # TODO: I don't know about it yet
      redirect_to items_path, notice: 'You are not authorized to edit this item.'
      return
    end
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
    if @item.shop_id != current_user.shop.id  # TODO: I don't know about it yet
      redirect_to items_path, notice: 'You are not authorized to edit this item.'
      return
    end
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  helper_method :can_user_edit_item
  def can_user_edit_item(item_id)
    current_user and current_user.shop and current_user.shop.id == item_id
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.fetch(:item, {})
    end

    def permitted_item_params
      params.require(:item).permit(:name, :stock, :description)
    end
end
