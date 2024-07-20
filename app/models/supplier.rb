class Supplier < ApplicationRecord
  has_many :invoices, dependent: :destroy
end
