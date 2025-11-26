class ShopsController < ApplicationController
  before_action :set_shop, only: %i[show edit update destroy]

  def index
    @keyword = params[:keyword]
    @shops = if @keyword.present?
               Shop.where("name LIKE ?", "%#{@keyword}%").order(rating: :desc)
             else
               Shop.order(rating: :desc)
             end
    @recommended_shops = Shop.where(recommended: true)
  end

  def show
    @reviews = @shop.reviews.includes(:user)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to @shop
    else
      render :new
    end
  end

  def edit; end

  def update
    if @shop.update(shop_params)
      redirect_to @shop
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :description, :rating, :recommended)
  end
end
