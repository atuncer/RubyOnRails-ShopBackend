class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :item, null: false, foreign_key: true
      t.string :comment
      t.float :star

      t.timestamps
    end
  end
end
