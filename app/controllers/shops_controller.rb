class ShopsController < ApplicationController
  before_action :like_find, only: [:show]

  def index
    @shops = Shop.includes(:images).limit(3)
    @rank_shops = Shop.includes(:images).order("shop_rate DESC").limit(3)
    @ramen_shop = Shop.find(2)
    @query = Shop.ransack(params[:q])
  end

  def show
    genre_shop =  GenreShop.where(shop_id: @shop.id).first
    @genre = Genre.find(genre_shop.genre_id)
    @rank_shops = Shop.includes(:images).order("shop_rate DESC").limit(3)

    if user_signed_in?
      @rate = Rate.find_by(user_id: current_user.id, shop_id: @shop.id)

      if @rate.nil?
        @rate = Rate.new(user_id: current_user.id, shop_id: @shop.id)
        @rate.save
      end
    end

    if @shop.shop_rate.nil?
      @shop_ave = 0
      @shop_rate = 'このお店はまだ評価されていません。'
    else
      @shop_ave = @shop.shop_rate * 20
      @shop_rate = @shop.shop_rate
    end


    @query = Shop.ransack(params[:q])
  end


  private

  def like_find
    @shop = Shop.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:genres_genre_name_or_shop_name_cont,:area_area_name_cont)
  end
end
