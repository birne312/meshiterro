class CreateUserShops < ActiveRecord::Migration[5.2]
  def change
    create_table :user_shops do |t|
      t.integer :user_id, foreign_key: true
      t.integer :shop_id, foreign_key: true
      t.boolean :like
      t.integer :rate
      t.timestamps
    end
  end
end
