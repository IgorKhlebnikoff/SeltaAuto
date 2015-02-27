require 'spec_helper'

describe InspectionRequest do
  let!(:user) { FactoryGirl.create(:user) }
  let(:inspection_request) { FactoryGirl.create(:inspection_request) }

  describe 'associations' do
    it { have_many(:service_types) }
    it { have_many(:inspection_request_service_types) }
    it { belong_to(:viewed_by) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }
  end

  describe 'scopes' do
    let!(:inspection_requests) { 3.times { FactoryGirl.create(:inspection_request) } }
    let!(:viewed_inspection_requests) { 3.times { FactoryGirl.create(:viewed_inspection_request) } }

    it 'returns unviewed inspection requests' do
      expect(InspectionRequest.new_inspection_requests).to have(3).items
    end
  end

  describe '#mark_as_viewed' do
    let!(:inspection_request) { FactoryGirl.create(:inspection_request) }

    it 'marks the inspection_request as viewed' do
      inspection_request.mark_as_viewed
      expect(inspection_request.viewed).to be_true
    end
  end
end
