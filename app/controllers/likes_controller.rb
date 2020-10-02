class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    user_like = @user.likes.map(&:shop_id)
    @liked_shop = Shop.with_shops(user_like)
  end

  def create
    like = Like.create(user_id: current_user.id, shop_id: params[:shop_id])
    @shop = like.shop
  end
end
