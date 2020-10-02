class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, default: '名無し'
  end
end
