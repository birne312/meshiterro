class AddColumnToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops,  :likes_count, :integer
    remove_column :shops, :comment_id, :integer
    remove_column :shops, :image_id, :integer
    remove_column :shops, :menu_id, :integer
  end
end
