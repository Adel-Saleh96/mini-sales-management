class Product < ApplicationRecord
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :sales

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity_in_stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
