class Shop < ApplicationRecord
  belongs_to :area
  has_many :logs
  has_many :images
  has_many :menus
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :rates, dependent: :destroy
  has_many :users, through: :rates
  has_many :genre_shops
  has_many :genres, through: :genre_shops
  accepts_nested_attributes_for :likes
  accepts_nested_attributes_for :rates

  scope :with_shops, ->(shop_id){ where(id: shop_id) }

  def rectangle_image
    if Image.exists?
    images.rectangle.first.image.to_s
    else
      'notfound.png'
    end
  end

  def square_image
    if Image.exists?
      images.square.first.image.to_s
    else
      'notfound.png'
    end
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  class << self
    def set_shop_rates
      self.all.each do |shop|
        shop.update(shop_rate: shop.rates.where.not(rate: nil).average(:rate))
      end
    end
  end
  # コンソールで実行
  # Shop.set_shop_rates
end
