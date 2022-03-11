class RemoveUserIdFromShop < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :user_id, :integer
  end
end
