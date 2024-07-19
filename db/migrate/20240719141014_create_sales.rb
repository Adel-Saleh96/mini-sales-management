class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.integer :product_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
