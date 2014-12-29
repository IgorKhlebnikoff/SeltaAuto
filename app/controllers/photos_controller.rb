class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new]
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.where(type: nil)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = photo_initiation

    respond_to do |format|
      if @photo.save
        format.html { redirect_to collection_path, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to collection_path, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to collection_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end
  def collection_path
    photos_path
  end

  def photo_initiation
    Photo.new(photo_params)
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      #params[:photo]
      params.require(:photo).permit!
    end
end
