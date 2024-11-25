class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :url
      t.string :shop
      t.references :product_category, null: false, foreign_key: true
      t.references :style, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
