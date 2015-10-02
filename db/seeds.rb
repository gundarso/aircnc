# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(name: "Car from movies")
Category.create(name: "Vintage car")
Category.create(name: "Day to day car")
Category.create(name: "Family car")
Category.create(name: "Minivan")
Category.create(name: "Supercar")

20.times do
  Car.create(
    mileage: Faker::Number.number(6),
    fuel: (['petrol', 'diesel', 'hybrid', 'electric']).max,
    seats: rand(2..7),
    pickup_address: Faker::Address.street_address + ', ' + Faker::Address.city,
    category_id: rand(1..6),
    rate: Faker::Number.number(3),
    latitude: Faker::Number.decimal(7),
    longitude: Faker::Number.decimal(7)
    )
end
