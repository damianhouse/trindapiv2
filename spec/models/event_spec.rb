require 'rails_helper'

RSpec.describe Event, type: :model do
  # Association tests
  it { should belong_to(:user) }
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:interests) }
  it { should validate_presence_of(:location) }
end
