class ServiceType < ActiveRecord::Base
  has_many :inspection_requests, through: :inspection_request_service_types
  has_many :inspection_request_service_types

  validates :name, presence: true
end
