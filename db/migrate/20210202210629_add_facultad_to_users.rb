class AddFacultadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Facultad, :string
  end
end
