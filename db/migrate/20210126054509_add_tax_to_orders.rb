class AddTaxToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :tax, :decimal, precision: 9, scale: 2
  end
end
