class AddIdentificationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Identification, :string
  end
end
