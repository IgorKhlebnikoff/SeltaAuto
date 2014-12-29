class PartnersController < ContentsController
  def index
    @contents = Partner.all.order('id ASC').page(params[:page]).per(5)
    respond_with(@news)
  end

  def new
    @content = Partner.new
    super
  end

  def create
    respond_with(Partner.create(partner_params), location: root_path)
  end

  def update
    respond_with(content.update_attributes(partner_params), location: services_path)
  end

  def destroy
    respond_with(content.destroy, location: root_path)
  end

  private

  def partner_params
    params.require(:partner).permit!
  end

  def content
    @content ||= Partner.find(params[:id])
  end
end
