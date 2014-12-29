class ServicesController < ContentsController
  def index
    @services = Service.all.order('id ASC').page(params[:page]).per(5)
    respond_with(@news)

  end

  def new
    @content = Service.new
    super
  end

  def create
    respond_with(Service.create(service_params), location: services_path)
  end

  def update
    respond_with(content.update_attributes(service_params), location: services_path)
  end

  def destroy
    respond_with(content.destroy, location: services_path)
  end

  private

  def service_params
    params.require(:service).permit!
  end

  def content
    @content ||= Service.find(params[:id])
  end
end
