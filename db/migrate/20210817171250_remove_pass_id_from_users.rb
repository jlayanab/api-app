class RemovePassIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :pass_id, :bigint
  end
end
