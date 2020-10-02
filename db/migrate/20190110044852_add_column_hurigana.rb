class AddColumnHurigana < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :hurigana, :string
  end
end
