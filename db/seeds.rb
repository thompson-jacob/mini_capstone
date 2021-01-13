# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create({ name: "Glowing Moon Lamp", price: 30, image_url: "https://i.pinimg.com/originals/b3/97/ce/b397ce7a0619f31ba362335694b833f2.png", description: "3 setting glowing moon lamp, great as a gift" })
products = Product.create({ name: "Star projector", price: 25, image_url: "https://sc04.alicdn.com/kf/H0501ae7855e748bc8cceb107a8b5d448i.jpg", description: "Star projector map/nightlight, plays music" })
products = Product.create({ name: "Mens Bohemian", price: 150, image_url: "https://i.etsystatic.com/24160929/r/il/8c4c72/2418772838/il_794xN.2418772838_h1p0.jpg", description: "Mens bohemian robe, 100% silk, great for festivals, lounging, eye catching, soft" })
