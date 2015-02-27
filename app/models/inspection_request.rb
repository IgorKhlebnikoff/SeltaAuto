class InspectionRequest < ActiveRecord::Base
  has_many :service_types, through: :inspection_request_service_types
  has_many :inspection_request_service_types

  belongs_to :viewed_by, class_name: 'User'

  validates :name, :phone_number, presence: true

  scope :not_viewed, -> { where(viewed: false) }

  after_create :send_email_notification

  def mark_as_viewed(user)
    update_attributes(viewed: true, viewed_by: user)
  end

  def to_builder
    Jbuilder.new do |ir|
      ir.created_at   created_at
      ir.name         name
      ir.phone_number phone_number
      ir.comment      comment
      ir.viewed       viewed
      ir.viewed_by    viewed_by.try(:full_name)
    end
  end

  private

  def send_email_notification
    InspectionRequestMailer.new_request(self).deliver
  end
end
