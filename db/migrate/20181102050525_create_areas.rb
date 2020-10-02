class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :area_name
      t.integer :area_id, null: true, foreign_key: true
      t.timestamps
    end
  end
end
