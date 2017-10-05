# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: "cheesecakes@gmail.com", password: "password", password_confirmation: "password")
10.times do |num|
    Event.create!(title: Faker::StarWars.quote, description: Faker::ChuckNorris.fact, location: Faker::StarWars.planet, interests: Faker::StarWars.vehicle, user_id: user.id)
end