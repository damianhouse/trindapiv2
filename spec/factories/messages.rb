FactoryGirl.define do
    factory :message do
        conversation_id { conversation }
        author_id { user }
        body { Faker::Hipster.sentences }
    end
end