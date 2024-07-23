# == Schema Information
#
# Table name: suppliers
#
#  id         :bigint           not null, primary key
#  address    :text
#  email      :string
#  name       :string           not null
#  phone      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Supplier < ApplicationRecord
  has_many :invoices, dependent: :destroy
end
