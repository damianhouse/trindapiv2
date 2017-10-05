class Event < ApplicationRecord
    belongs_to :event_creator, class_name: "User"
    validates_presence_of :title, :description, :event_creator, :interests, :location
end
