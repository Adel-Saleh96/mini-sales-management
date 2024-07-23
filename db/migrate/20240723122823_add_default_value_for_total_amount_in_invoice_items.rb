class AddDefaultValueForTotalAmountInInvoiceItems < ActiveRecord::Migration[7.1]
  def change
    change_column_default :invoice_items, :unit_price, 0.0
    change_column_default :invoice_items, :total_amount, 0.0

    up_only do
      execute <<~SQL
        UPDATE invoice_items
        SET unit_price = 0.0
        WHERE unit_price IS NULL
      SQL

      execute <<~SQL
        UPDATE invoice_items
        SET total_amount = 0.0
        WHERE total_amount IS NULL
      SQL
    end
  end
end
