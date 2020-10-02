class UserShop < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_shops
  end
end
