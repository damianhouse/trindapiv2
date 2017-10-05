class Conversation < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :recipient, class_name: "User"

    validates_presence_of :sender_id, :recipient_id
end
