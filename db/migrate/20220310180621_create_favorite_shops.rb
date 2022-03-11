class CreateFavoriteShops < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_shops do |t|
      t.integer :shop_id
      t.integer :user_id

      t.timestamps
    end
  end
end
