require 'rails_helper'

RSpec.describe Conversation, type: :model do
  # Association tests
  it { should belong_to(:sender).class_name("User") }
  it { should belong_to(:recipient).class_name("User") }
  # Validation tests
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:recipient_id) }
end