class AddDefaultToBudget < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :budget, from: nil, to: 0.0
  end
end
