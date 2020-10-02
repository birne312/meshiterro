class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id, foreign_key: true
      t.integer :shop_id, foreign_key: true
      t.integer :rate
      t.timestamps
    end
  end
end
