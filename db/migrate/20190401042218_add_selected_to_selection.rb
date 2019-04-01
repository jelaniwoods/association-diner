class AddSelectedToSelection < ActiveRecord::Migration[5.2]
  def change
    add_column :selections, :selected, :boolean
  end
end
