class CreateLevelItems < ActiveRecord::Migration[5.2]
  def change
    create_table :level_items do |t|
      t.integer :item_id
      t.integer :level_id

      t.timestamps
    end
  end
end
