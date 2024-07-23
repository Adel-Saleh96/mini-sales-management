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
require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
