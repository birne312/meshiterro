class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.integer :shop_id, foreign_key: true
      t.timestamps
    end
  end
end
