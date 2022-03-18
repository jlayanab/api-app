class AddNombresToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Nombres, :string
  end
end
