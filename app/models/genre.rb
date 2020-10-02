class Genre < ApplicationRecord
  has_many :genre_shops
  has_many :shops, through: :genre_shops
  accepts_nested_attributes_for :genre_shops
end
