class AddShopIdToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :shop, null: false, foreign_key: true
  end
end
