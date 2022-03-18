class AddUserToPasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :passes, :user, foreign_key: true
  end
end
