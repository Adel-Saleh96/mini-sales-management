# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!([
  {
    user_name: 'admin',
    password: 'password123',
    is_admin: true
  },
  {
    user_name: 'user1',
    password: 'password123',
    is_admin: false
  },
  {
    user_name: 'user2',
    password: 'password123',
    is_admin: false
  },
  {
    user_name: 'user3',
    password: 'password123',
    is_admin: false
  }
])

# Create Suppliers
supplier1 = Supplier.create(
  name: 'ABC Inc.',
  email: 'info@abcinc.com',
  phone: '555-1234',
  address: '123 Main St, Anytown USA'
)

supplier2 = Supplier.create(
  name: 'XYZ Co.',
  email: 'sales@xyzco.com',
  phone: '555-5678',
  address: '456 Oak Rd, Othertown CA'
)

# Create Products
product1 = Product.create(
  name: 'Widget',
  description: 'A basic widget for your needs',
  price: 9.99,
  quantity_in_stock: 50
)

product2 = Product.create(
  name: 'Gadget',
  description: 'A fancy gadget for your convenience',
  price: 19.99,
  quantity_in_stock: 25
)

product3 = Product.create(
  name: 'Doohickey',
  description: 'A essential doohickey for your projects',
  price: 4.99,
  quantity_in_stock: 100
)

# Create Invoices
invoice1 = Invoice.create(
  supplier: supplier1,
  invoice_number: 'INV-001',
  date: '2023-06-01',
  total_amount: 500.00
)

invoice2 = Invoice.create(
  supplier: supplier2,
  invoice_number: 'INV-002',
  date: '2023-07-15',
  total_amount: 750.00
)

# Create Invoice Items
InvoiceItem.create(
  invoice: invoice1,
  product: product1,
  unit_price: 10,
  quantity: 20
)

InvoiceItem.create(
  invoice: invoice1,
  product: product2,
  unit_price: 10,
  quantity: 10
)

InvoiceItem.create(
  invoice: invoice2,
  product: product2,
  unit_price: 10,
  quantity: 15
)

InvoiceItem.create(
  invoice: invoice2,
  product: product3,
  unit_price: 10,
  quantity: 50
)

sales = [
  { product_id: Product.first.id, quantity: 20, price: 10.99 },
  { product_id: Product.second.id, quantity: 10, price: 15.99 },
  { product_id: Product.third.id, quantity: 15, price: 8.99 }
]

sales.each do |sale_attrs|
  Sale.create!(sale_attrs)
end
