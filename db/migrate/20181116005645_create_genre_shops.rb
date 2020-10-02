class CreateGenreShops < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_shops do |t|
      t.integer :shop_id, foreign_key: true
      t.integer :genre_id, foreign_key: true
      t.timestamps
    end
  end
end
