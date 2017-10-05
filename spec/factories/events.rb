FactoryGirl.define do
    factory :event do
        title { Faker::StarWars.quote }
        description { Faker::ChuckNorris.fact }
        location { Faker::StarWars.planet }
        interests { Faker::StarWars.vehicle }
        event_creator { rand(1..1000) }
    end
end