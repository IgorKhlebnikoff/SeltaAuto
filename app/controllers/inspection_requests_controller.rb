class InspectionRequestsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!, except: :create
  before_filter :inspection_request, only: [:show, :destroy, :mark_as_viewed]

  def index
    respond_with(@inspection_requests = InspectionRequest.all.order(created_at: :desc), location: request.referrer)
  end

  def show
    inspection_request.mark_as_viewed(current_user)
    respond_with inspection_request
  end

  def create
    respond_with InspectionRequest.create(inspection_request_params), location: request.referrer
  end

  def destroy
    respond_with inspection_request.destroy, location: request.referrer
  end

  def new_inspection_requests
    respond_with InspectionRequest.new_inspection_requests, location: request.referrer
  end

  def mark_as_viewed
    respond_with inspection_request.mark_as_viewed, location: request.referrer
  end

  private

  def inspection_request
    @inspection_request ||= InspectionRequest.find_by_id(params[:id])
  end

  def inspection_request_params
    params.require(:inspection_request).permit(:name, :phone_number, :comment)
  end
end
