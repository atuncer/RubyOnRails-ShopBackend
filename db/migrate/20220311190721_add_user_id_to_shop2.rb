class AddUserIdToShop2 < ActiveRecord::Migration[7.0]
  def change
    add_reference :shops, :user, index: {:unique=>true}, null: false, foreign_key: true
  end
end
