class AddIsVisibleToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :isVisible, :boolean
  end
end
