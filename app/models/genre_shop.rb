class GenreShop < ApplicationRecord
  belongs_to :genre
  belongs_to :shop

  scope :with_genres, ->(g_id){ where('genre_id = ?', g_id) }
end
