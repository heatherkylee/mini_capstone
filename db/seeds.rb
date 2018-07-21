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
# suppliers = Supplier.all
# products = Product.all

# products.each do |product|
#   product.supplier_id = suppliers.sample.id
#   product.save
# end

# same as above
# products.each do |product|

# suppliers = Supplier.all
# products = Product.all

# product.update(:supplier_id => suppliers.sample.id)
# end

# Add images
# image1 = Image.create(name: "cheesy french fries, string ", url: "https://gardengyrosonline.com/wp-content/uploads/2018/01/cheese-fries.jpg")
# image2 = Image.create(name: "cheesy french fries, steak", url: "http://assets.kraftfoods.com/recipe_images/Cheesy-Tex-Mex-French-Fries-37521.jpg")
# image3 = Image.create(name: "cheesy french fries, tots", url: "http://www.naivecookcooks.com/wp-content/uploads/2014/11/Cheesy-Goodness-of-Roasted-Veggies-Tater-Tots-Mac-and-Cheese.jpg")

# Add images using faker
# products = Product.all

# products.each do |product|
#   Image.create(url: Faker::Avatar.image("my-own-slug", "50x50"), product_id: product.id)
# end