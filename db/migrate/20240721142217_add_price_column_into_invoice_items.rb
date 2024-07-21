class AddPriceColumnIntoInvoiceItems < ActiveRecord::Migration[7.1]
  def change
    add_column :invoice_items, :price, :decimal, precision: 10, scale: 2
  end
end
