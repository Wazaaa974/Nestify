class AddBoughtToProposals < ActiveRecord::Migration[7.1]
  def change
    add_column :proposals, :bought, :boolean
  end
end
