class ChangeDatatypeTelOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :tel, :integer, :limit => 8  
  end
end
