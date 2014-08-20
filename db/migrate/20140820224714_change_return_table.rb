class ChangeReturnTable < ActiveRecord::Migration
  def change
    remove_column :returns, :customer_id, :int
    remove_column :returns, :employee_id, :int

    add_column :returns, :transaction_id, :int
  end
end
