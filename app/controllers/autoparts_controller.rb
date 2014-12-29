class AutopartsController < ApplicationController
  respond_to :html
  respond_to :json, only: :index

  before_filter :autopart, except: [:index, :new, :create, :import]

  def index
    @autoparts = Autopart.all
    respond_with(@autoparts)
    #respond_to do |format|
      #format.html
      #format.json { render json: AutopartsDatatable.new(view_context) }
    #end
  end

  def new
    @autopart = Autopart.new
    respond_with(@autopart)
  end

  def create
    respond_with(@autopart, location: autoparts_path)
  end

  def edit
    respond_with(autopart)
  end

  def update
    autopart.update_attributes(autopart_params)
  end

  def destroy
    autopart.destroy
  end

  private

  def autopart
    @autopart ||= Autopart.find_by_id(params[:id])
  end

  def autopart_params
    params.require(:autopart).permit!
  end
end
