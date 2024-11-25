class CreateProductPackages < ActiveRecord::Migration[7.1]
  def change
    create_table :product_packages do |t|
      t.references :product, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true

      t.timestamps
    end
  end
end
