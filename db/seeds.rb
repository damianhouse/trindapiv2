# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password", birthday: Faker::Date.birthday, name: Faker::StarWars.character)

2.times do |num|
    user2 = User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password", birthday: Faker::Date.birthday, name: Faker::StarWars.character)
    convo = Conversation.create!(sender_id: user.id, recipient_id: user2.id)
    # 10.times do |n|
    #     if n % 2 === 0
    #         Message.create!(conversation_id: convo.id, body: Faker::StarWars.quote, author: user.id)
    #     else
    #         Message.create!(conversation_id: convo.id, body: Faker::StarWars.wookiee_sentence, author: user2.id)
    #     end
    # end
end

10.times do |num|
    Event.create!(title: Faker::StarWars.quote, description: Faker::ChuckNorris.fact, location: Faker::StarWars.planet, interests: Faker::StarWars.vehicle, user_id: user.id)
end