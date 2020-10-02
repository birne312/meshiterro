class SearchController < ApplicationController
  def search
    @query = Shop.ransack(search_params)
    @shops = @query.result(distinct: true)
    @count = @shops.count
  end

  private
  def search_params
    params.require(:q).permit(:genres_genre_name_or_shop_name_cont,:area_area_name_cont)
  end
end
