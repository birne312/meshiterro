class RatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    user_rate = @user.rates.map(&:shop_id)
    @rated_shop = Shop.with_shops(user_rate)
  end

  def update
    shop = Shop.find(params[:shop_id])
    rate = Rate.find_by(user_id: current_user.id, shop_id: shop.id)
    rate.update(rate_params)
    redirect_to shop_path(shop)
  end

  private

  def rate_params
    params.require(:rate).permit(:rate)
  end

end
