class CreateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters do |t|
      t.string :pathfinal
      t.string :statusfinal
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
