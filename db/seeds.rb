# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do
#   product = Product.create(name: Faker::Dessert.variety, price: Faker::Number.between(5, 20), description: Faker::Dessert.flavor, image: "")
# end

# supplier1 = Supplier.create(name: "Dunkin' Donuts", email: "dunkin@donuts.com", phone_number: "1231231234")
# supplier2 = Supplier.create(name: "Starbux", email: "star@bux.com", phone_number: "4564564567")

# associate the products with a supplier 

suppliers = Supplier.all
products = Product.all

products.each do |product|
  product.supplier_id = suppliers.sample.id
  product.save
end

# same as above

# suppliers = Supplier.all
# products = Product.all

# products.each do |product|
#   product.update(:supplier_id => suppliers.sample.id)
# end
