class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.integer :item_id
      t.integer :level_id

      t.timestamps
    end
  end
end