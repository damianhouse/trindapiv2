2.times do |num|
    user1 = User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password", birthday: Faker::Date.birthday, name: Faker::StarWars.character)
    user2 = User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password", birthday: Faker::Date.birthday, name: Faker::StarWars.character)
    convo = Conversation.create!(sender_id: user1.id, recipient_id: user2.id)

    10.times do |n|
        if n % 2 === 0
            Message.create!(conversation_id: convo.id, body: Faker::StarWars.quote, author_id: user1.id)
        else
            Message.create!(conversation_id: convo.id, body: Faker::StarWars.wookiee_sentence, author_id: user2.id)
        end
    end
end
user = User.create!(email: Faker::Internet.email, password: "password", password_confirmation: "password", birthday: Faker::Date.birthday, name: Faker::StarWars.character)

10.times do |num|
    Event.create!(title: Faker::StarWars.quote, description: Faker::ChuckNorris.fact, location: Faker::StarWars.planet, interests: Faker::StarWars.vehicle, user_id: user.id)
end