FactoryGirl.define do
    factory :user, aliases: [:sender, :recipient] do
        name { Faker::StarWars.character }
        email { Faker::Internet.email }
        password { "password" }
        password_confirmation { "password" }
        birthday { Faker::Date.birthday }
    end
end