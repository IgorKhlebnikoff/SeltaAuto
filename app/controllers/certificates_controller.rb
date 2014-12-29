class CertificatesController < PhotosController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Certificate.all
  end

  def new
    @photo = Certificate.new
  end

  def collection_path
    certificates_path
  end

  def photo_initiation
     Certificate.new(photo_params)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Certificate.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    #params[:photo]
    params.require(:certificate).permit!
  end
end

