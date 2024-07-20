class Invoice < ApplicationRecord
  belongs_to :supplier
  has_many :invoice_items, dependent: :destroy
  has_many :products, through: :invoice_items

  validates :invoice_number, presence: true
  validates :date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_default, on: :create
  before_validation :calculate_total_amount

  private

  def set_default
    self.invoice_number ||= "INV-#{Time.current.to_i}"
    self.date ||= Time.current
  end

  def calculate_total_amount
    self.total_amount = invoice_items.sum { |item| item.quantity * item.product.price }
  end
end
