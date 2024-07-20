class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  after_create :update_invoice_total_amount
  after_create :update_inventory

  private

  def update_invoice_total_amount
    invoice.total_amount += quantity * product.price
    invoice.save!
  end

  def update_inventory
    product.quantity_in_stock += self.quantity
    product.save!
  end
end
