# == Schema Information
#
# Table name: sales
#
#  id         :bigint           not null, primary key
#  price      :decimal(, )
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_sales_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Sale < ApplicationRecord
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :quantity, numericality: { less_than_or_equal_to: :quantity_in_stock }
  validate :product_in_stock

  after_create :reduce_product_quantity
  after_destroy :increase_product_quantity

  private

  def quantity_in_stock
    product.quantity_in_stock
  end

  def product_in_stock
    errors.add(:product, 'إنتهى من المخزن!') if product.present? && product.out_of_stock?
  end

  def reduce_product_quantity
    product.decrement!(:quantity_in_stock, quantity)
  end

  def increase_product_quantity
    product.increment!(:quantity_in_stock, quantity)
  end
end
