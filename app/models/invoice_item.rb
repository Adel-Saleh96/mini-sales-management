class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }

  after_create :update_invoice_total_amount

  private

  def update_invoice_total_amount
    invoice.total_amount += quantity * product.price
    invoice.save!
  end
end
