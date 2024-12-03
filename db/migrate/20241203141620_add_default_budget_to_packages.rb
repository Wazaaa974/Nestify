class AddDefaultBudgetToPackages < ActiveRecord::Migration[7.1]
  def change
    change_column_default :packages, :budget, from: nil, to: 0.0
  end
end
