require 'spec_helper'

describe InspectionRequestServiceType do
  describe 'associations' do
    it { should belong_to(:inspection_request) }
    it { should belong_to(:service_type) }
  end
end
