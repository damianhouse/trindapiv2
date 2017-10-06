class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :author, class_name: "User"

    validates_presence_of :conversation_id, :author_id, :body
end