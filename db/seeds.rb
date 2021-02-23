# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#remember that .create will make a .new instance in ruby while also saving that instance into the database.
#USERS
User.create!(name: "user", email: "user@email.com", password: "password")
User.create!(name: "jacob", email: "jacob@email.com", password: "password")
User.create!(name: "admin", email: "admin@email.com", password: "password")
User.create!(name: "test", email: "test@email.com", password: "password")
#SUPPLIERS
Supplier.create!(name: "Alibaba", email: "Alibaba@email.com", phone: "1-800-828-4444")
Supplier.create!(name: "Oberlo", email: "Oberlo@email.com", phone: "1-800-878-6969")
Supplier.create!(name: "Amazon", email: "Amazon@email.com", phone: "1-800-878-6969")
Supplier.create!(name: "Dropship US", email: "Alibaba@email.com", phone: "1-800-878-6969")
#PRODUCTS

Product.create!({ name: "Glowing Moon Lamp", price: 30, description: "3 setting glowing moon lamp, great as a gift", supplier_id: 1 })
Product.create!({ name: "Star projector", price: 25.99, description: "Star projector map/nightlight, plays music", supplier_id: 1 })
Product.create!({ name: "Mens Bohemian", price: 150.00, description: "Mens bohemian robe, 100% silk, great for festivals, lounging, eye catching, soft", supplier_id: 1 })
Product.create!({ name: "Tye-dye Tapestry", price: 46.00, description: "Psychadelic tapestry, lots of variety, great for apartments, houses, festivals", supplier_id: 1 })


#IMAGES
Image.create!(url: "https://i.pinimg.com/originals/b3/97/ce/b397ce7a0619f31ba362335694b833f2.png", product_id: 1)
Image.create!(url: "https://sc04.alicdn.com/kf/H0501ae7855e748bc8cceb107a8b5d448i.jpg", product_id: 2)
Image.create!(url: "https://i.etsystatic.com/24160929/r/il/8c4c72/2418772838/il_794xN.2418772838_h1p0.jpg", product_id: 3)
Image.create!(url: "https://s.alicdn.com/@sc01/kf/H15ac2da1e6134ee49d9b5db29dd11bacU.jpg_300x300.jpg", product_id: 4)
Image.create!(url: "https://sc04.alicdn.com/kf/Hedd952deb276495fae76e09f661b3e98u.jpg_Q55.jpg", product_id: 3)

#CATEGORIES
Category.create!(name: "Apparel")
Category.create!(name: "Home Goods")
Category.create!(name: "Misc.")

#CATEGORY_PRODUCTS
CategoryProduct.create!(category_id: 3, product_id: 1)
CategoryProduct.create!(category_id: 3, product_id: 2)
CategoryProduct.create!(category_id: 2, product_id: 4)
CategoryProduct.create!(category_id: 1, product_id: 3)

#CARTED_PRODUCTS
