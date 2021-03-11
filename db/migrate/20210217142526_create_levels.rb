class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :semestre
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
