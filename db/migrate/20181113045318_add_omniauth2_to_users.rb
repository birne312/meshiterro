class AddOmniauth2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :string
    add_column :users, :meta, :string
  end
end
