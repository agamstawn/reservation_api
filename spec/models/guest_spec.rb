require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:phone_numbers).dependent(:destroy) }

  it { should validate_uniqueness_of(:email) }
end
