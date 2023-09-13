# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Product.destroy_all
User.destroy_all 

User.create!(
    name: "Ngo Trong Tin",
    email: "tigopro.1703@gmail.com",
    password: "password",
    password_confirmation: "password",
    admin: true
)

10.times do |i|
    Product.create!(
        name: "product#{i}",
        price: "300#{i}k"
    )
end