class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :favorite_items, :item, :item_id
  end
end
