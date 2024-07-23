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
require "test_helper"

class InvoiceItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
