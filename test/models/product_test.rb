# == Schema Information
#
# Table name: products
#
#  id                :bigint           not null, primary key
#  description       :text
#  name              :string           not null
#  price             :decimal(10, 2)
#  quantity_in_stock :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
