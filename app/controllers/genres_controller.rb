class GenresController < ApplicationController
  def ramen
    genre_shops = GenreShop.with_genres(1).map(&:shop_id)
    @shops = Shop.where(id: genre_shops)

    @query = Shop.ransack(params[:q])
  end

  def sushi
    genre_shops = GenreShop.with_genres(2).map(&:shop_id)
    @shops = Shop.where(id: genre_shops)

    @query = Shop.ransack(params[:q])
  end

  def teishoku
  end

  def izakaya
  end

end
