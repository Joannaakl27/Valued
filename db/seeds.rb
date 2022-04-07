# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require "date"

Consumable.destroy_all
User.destroy_all

User.create!(
  email: "aaribaud@hotmail.com",
  password: "123456",
  username: "Anthony"
)

Consumable.create!(
  serving_size: 100,
  number_of_servings: 1,
  purchase_date: Date.strptime('03-04-2022', '%d-%m-%Y'),
  user: User.first,
  product_barcode: "12345678",
  product_name: "food",
  product_image: "",
  product_brand: "coop",
  emission: 5.5
)

Consumable.create!(
  serving_size: 100,
  number_of_servings: 1,
  purchase_date: Date.strptime('04-04-2022', '%d-%m-%Y'),
  user: User.first,
  product_barcode: "12345678",
  product_name: "food",
  product_image: "",
  product_brand: "coop",
  emission: 6.5
)

Consumable.create!(
  serving_size: 100,
  number_of_servings: 1,
  purchase_date: Date.strptime('05-04-2022', '%d-%m-%Y'),
  user: User.first,
  product_barcode: "12345678",
  product_name: "food",
  product_image: "",
  product_brand: "coop",
  emission: 6
)

Consumable.create!(
  serving_size: 100,
  number_of_servings: 1,
  purchase_date: Date.strptime('06-04-2022', '%d-%m-%Y'),
  user: User.first,
  product_barcode: "12345678",
  product_name: "food",
  product_image: "",
  product_brand: "coop",
  emission: 5.7
)

Consumable.create!(
  serving_size: 100,
  number_of_servings: 1,
  purchase_date: Date.strptime('07-04-2022', '%d-%m-%Y'),
  user: User.first,
  product_barcode: "12345678",
  product_name: "food",
  product_image: "",
  product_brand: "coop",
  emission: 5
)
