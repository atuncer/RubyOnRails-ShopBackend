class AddIsLiveToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :isLive, :boolean
  end
end
