# == Schema Information
#
# Table name: invoice_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(10, 2)
#  quantity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  invoice_id :bigint           not null
#  product_id :bigint           not null
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
  validates :price, presence: true, numericality: { greater_than: 0 }

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
