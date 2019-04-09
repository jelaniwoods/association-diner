class ChangeLevelIdToQueryIdForSelection < ActiveRecord::Migration[5.2]
  def change
    rename_column :selections, :level_id, :query_id
  end
end
