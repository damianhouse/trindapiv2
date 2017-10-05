require 'rails_helper'

RSpec.describe Event, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:interests) }
  it { should validate_presence_of(:location) }
end
