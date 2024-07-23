# == Schema Information
#
# Table name: invoice_items
#
#  id           :bigint           not null, primary key
#  quantity     :integer          not null
#  total_amount :decimal(10, 2)   default(0.0)
#  unit_price   :decimal(10, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  invoice_id   :bigint           not null
#  product_id   :bigint           not null
#
# Indexes
#
#  index_invoice_items_on_invoice_id  (invoice_id)
#  index_invoice_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#  fk_rails_...  (product_id => products.id)
#
class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  before_validation :calculate_total_amount
  after_save :update_invoice_total_amount
  after_save :update_inventory, if: :saved_change_to_quantity?
  after_destroy :reduce_invoice_total_amount
  after_destroy :reduce_inventory

  private

  def calculate_total_amount
    self.total_amount = self.quantity * self.unit_price
  end

  def update_invoice_total_amount
    invoice.total_amount += self.total_amount
    invoice.save!
  end

  def update_inventory
    product.quantity_in_stock += self.quantity
    product.save!
  end

  def reduce_invoice_total_amount
    invoice.total_amount -= self.total_amount
    invoice.save!
  end

  def reduce_inventory
    product.quantity_in_stock -= self.quantity
    product.save!
  end
end
