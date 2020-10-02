class RenameImageUrlColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :image_url, :image
  end
end
