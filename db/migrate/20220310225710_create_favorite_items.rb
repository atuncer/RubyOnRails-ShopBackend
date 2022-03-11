class CreateFavoriteItems < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_items do |t|
      t.integer :item
      t.integer :user_id

      t.timestamps
    end
  end
end
