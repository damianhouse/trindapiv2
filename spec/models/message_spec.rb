require 'rails_helper'

RSpec.describe Message, type: :model do
  # Association tests
  it { should belong_to(:conversation) }
  # Validation tests
  it { should validate_presence_of(:conversation_id) }
  it { should validate_presence_of(:author_id) }
  it { should validate_presence_of(:body) }
end