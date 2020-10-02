class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs, id: :integer do |t|
      t.integer :user_id, foreign_key: true
      t.integer :shop_id, foreign_key: true
      t.timestamp :day

      t.timestamps
    end
  end
end
