class AddNivelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Nivel, :string
  end
end
