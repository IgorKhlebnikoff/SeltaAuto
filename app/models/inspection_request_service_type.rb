class InspectionRequestServiceType < ActiveRecord::Base
  belongs_to :inspection_request
  belongs_to :service_type
end
