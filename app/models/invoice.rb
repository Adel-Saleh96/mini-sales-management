class Invoice < ApplicationRecord
  belongs_to :supplier
  has_many :invoice_items, dependent: :destroy
  has_many :products, through: :invoice_items

  validates :invoice_number, presence: true
  validates :date, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
