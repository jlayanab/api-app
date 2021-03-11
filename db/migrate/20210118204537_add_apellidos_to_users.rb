class AddApellidosToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Apellidos, :string
  end
end
