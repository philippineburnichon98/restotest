# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."

Restaurant.destroy_all
Category.destroy_all
Favorite.destroy_all
Reservation.destroy_all
User.destroy_all

puts "Creating users..."
n = 1
5.times do
  User.create!(
    email: "user#{n}@gmail.com",
    password: "password",
    address: Faker::Address.full_address,
    username: Faker::Beer.brand
  )
  n += 1
end

puts "Creating categories..."
5.times do
  Category.create!(
    name: Faker::Food.ethnic_category
  )
end

puts "Creating restaurants..."
10.times do
  category = Category.order(Arel.sql('RANDOM()')).first
  Restaurant.create!(
    name: Faker::Games::SuperMario.location,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    description: Faker::Lorem.paragraph,
    rating: rand(1..5),
    category: category
  )
end

puts "Creating favorites..."
5.times do
  user = User.order(Arel.sql('RANDOM()')).first
  restaurant = Restaurant.order(Arel.sql('RANDOM()')).first
  Favorite.create!(
    user: user,
    restaurant: restaurant
  )
end

puts "Creating reservations..."
5.times do
  user = User.order(Arel.sql('RANDOM()')).first
  restaurant = Restaurant.order(Arel.sql('RANDOM()')).first
  Reservation.create!(
    restaurant: restaurant,
    user: user,
    date: Faker::Date.forward(days: 30),
    guest_number: rand(2..10)
  )
end

puts "DONE"
