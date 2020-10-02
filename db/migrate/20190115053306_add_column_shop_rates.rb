class AddColumnShopRates < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :shop_rate, :float
  end
end
