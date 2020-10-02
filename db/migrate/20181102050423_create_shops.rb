class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops, id: :integer do |t|
      t.string :shop_name
      t.integer :area_id, foreign_key: true
      t.text :shop_detail
      t.integer :tel
      t.string :address
      t.text :address_url
      t.integer :postal_code
      t.string :regular_holiday
      t.string :business_hours
      t.integer :comment_id, foreign_key: true
      t.integer :image_id, foreign_key: true
      t.integer :menu_id, foreign_key: true
      t.timestamps
    end
  end
end
