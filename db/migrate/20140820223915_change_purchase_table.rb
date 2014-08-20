class ChangePurchaseTable < ActiveRecord::Migration
  def change
    remove_column :purchases, :customer_id, :int
    remove_column :purchases, :employee_id, :int

    add_column :purchases, :transaction_id, :int
  end
end
