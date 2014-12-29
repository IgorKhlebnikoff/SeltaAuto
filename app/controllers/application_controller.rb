class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :inspection_request, unless: :format_json?
  before_filter :inspection_requests, unless: :format_json?
  before_action :set_locale

  def format_json?
    request.format.json?
  end

  def have_access?
    redirect_to root_path unless current_user.try(:is_admin?)
  end

  def inspection_requests
    @inspection_requests_size = InspectionRequest.not_viewed.size
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = params[:locale] if params[:locale]
  end

  private

  def inspection_request
    @inspection_request = InspectionRequest.new
  end
end
