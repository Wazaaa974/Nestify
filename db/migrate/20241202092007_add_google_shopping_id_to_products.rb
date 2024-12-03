class AddGoogleShoppingIdToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :google_shopping_id, :string
  end
end
