class AddBudgetToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :budget, :float
  end
end
