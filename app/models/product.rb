class Product < ApplicationRecord
  has_many :invoice_items, dependent: :destroy
  has_many :invoices, through: :invoice_items
  has_many :sales, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity_in_stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  before_validation :set_default, on: :create

  def out_of_stock?
    quantity_in_stock.zero?
  end

  private

  def set_default
    self.quantity_in_stock ||= 0
  end
end
