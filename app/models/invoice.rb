# == Schema Information
#
# Table name: invoices
#
#  id             :bigint           not null, primary key
#  date           :date
#  invoice_number :string
#  total_amount   :decimal(10, 2)   not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  supplier_id    :bigint           not null
#
# Indexes
#
#  index_invoices_on_supplier_id  (supplier_id)
#
# Foreign Keys
#
#  fk_rails_...  (supplier_id => suppliers.id)
#
class Invoice < ApplicationRecord
  belongs_to :supplier
  has_many :invoice_items, dependent: :destroy
  has_many :products, through: :invoice_items

  validates :invoice_number, presence: true
  validates :date, presence: true

  before_validation :set_default, on: :create

  private

  def set_default
    self.invoice_number ||= "INV-#{Time.current.to_i}"
    self.date ||= Time.current
    self.total_amount ||= 0
  end
end
