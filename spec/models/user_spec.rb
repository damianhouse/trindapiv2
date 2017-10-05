require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association tests
  it { should have_many(:events) }
  it { should have_many(:conversations_as_sender).class_name("Conversation") }
  it { should have_many(:conversations_as_recipient).class_name("Conversation") }
  # Validation tests
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:birthday) }
end