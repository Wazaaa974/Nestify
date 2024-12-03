class AddDescriptionToPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :packages, :description, :string
  end
end
