class AddColumnToImage < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :status, :integer, default: 0
  end
end
