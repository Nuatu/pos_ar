class CreateBaseTables < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name

      t.timestamps
    end

    create_table :employees do |t|
      t.string :name

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.string :brand
      t.float :price

      t.timestamps
    end

    create_table :purchases do |t|
      t.integer :employee_id
      t.integer :product_id
      t.integer :customer_id

      t.timestamps
    end

    create_table :returns do |t|
      t.integer :product_id
      t.integer :employee_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
