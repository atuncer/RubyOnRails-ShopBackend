class ShopsController < ApplicationController
  before_action :set_shop, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  # GET /shops or /shops.json
  def index
    @shops = Shop.where(user_id: current_user.id)
  end

  # GET /shops/1 or /shops/1.json
  def show

  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
    if @shop.user_id != current_user.id
      redirect_to shops_path, notice: 'You are not authorized to edit this shop.'
    end
  end

  # POST /shops or /shops.json
  def create
    # WHY DOESN'T THIS WORK?
    # WHEN I MANUALLY TYPE {"name"=>"AAAAAA", "bio"=>"AAAA"} , IT WORKS :D
    # WHEN IT COMES INSIDE shop_params, IT DOESN'T WORK :DDDDDD
    # so it seems it was passed as a "ActionController::Parameters" object, not as a hash
    # ActionController::Parameters.permit_all_parameters = true
    # I think this is disabled by default for sql injection prevention

    permitted = shop_params.permit(:name, :bio)
    # Whenever I do a migration that edits columns, I guess have to add the new columns to these permitted params
    # so I don't think this is a scalable solution. However this is the suggested solution
    @shop = Shop.new(permitted)
    @shop.user = current_user

    respond_to do |format|
      if @shop.save and current_user
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    if @shop.user_id != current_user.id
      redirect_to shops_path, notice: 'You are not authorized to update this shop.'
      return
    end
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_url(@shop), notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    if @shop.user_id != current_user.id
      redirect_to shops_path, notice: 'You are not authorized to edit this shop.'
      return
    end
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.fetch(:shop, {})
    end
end