class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :invoice_number
      t.date :date
      t.decimal :total_amount, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
