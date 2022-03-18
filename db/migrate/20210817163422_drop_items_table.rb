class DropItemsTable < ActiveRecord::Migration[5.2]
  def change
    def up
      drop_table :items
    end
  
    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
