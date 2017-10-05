FactoryGirl.define do
    factory :conversation do
        sender_id { sender }
        recipient_id { recipient }
    end
end