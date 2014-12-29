require 'spec_helper'

describe ServiceType do
  describe 'associations' do
    it { should have_many(:inspection_requests) }
    it { should have_many(:inspection_request_service_types) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
