class CreatePasses < ActiveRecord::Migration[5.2]
  def change
    create_table :passes do |t|
      t.bigint :code
      t.date :datein
      t.date :dateout
      t.string :status

      t.timestamps
    end
  end
end
