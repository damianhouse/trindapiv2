class Event < ApplicationRecord
    validates_presence_of :title, :description, :event_creator, :interests, :location
end
