class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_shop
  before_action :set_review, only: %i[edit update destroy]

  def create
    @review = @shop.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @shop
    else
      redirect_to @shop, alert: "投稿に失敗しました"
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
