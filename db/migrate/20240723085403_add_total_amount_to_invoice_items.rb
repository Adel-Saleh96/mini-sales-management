class AddTotalAmountToInvoiceItems < ActiveRecord::Migration[7.1]
  def change
    add_column :invoice_items, :total_amount, :decimal, precision: 10, scale: 2
    rename_column :invoice_items, :price, :unit_price
  end
end
