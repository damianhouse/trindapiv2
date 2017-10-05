FactoryGirl.define do
    factory :user do
        name { Faker::StarWars.character }
        email { Faker::Internet.email }
        password { "password" }
        password_confirmation { "password" }
        birthday { Faker::Date.birthday }
    end
end