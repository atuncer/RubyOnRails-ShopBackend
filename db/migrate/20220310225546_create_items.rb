class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :stock
      t.string :description

      t.timestamps
    end
  end
end
