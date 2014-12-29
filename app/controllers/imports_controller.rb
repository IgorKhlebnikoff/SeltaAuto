class ImportsController < ApplicationController
  respond_to :html, except: [:necessary_columns, :update_columns]
  respond_to :js, only: [:necessary_columns, :update_columns]

  before_filter :have_access?
  before_filter :import, only: [:show, :destroy, :make_snapshots]

  def index
    @imports = Imports::Base.all
  end

  def new
    @import = Imports::Autopart.new
    respond_with(@import)
  end

  def create
    import = ImportsService.new(import_params: import_params).create_import
    respond_with(import, location: imports_path)
  end

  def destroy
    respond_with(import.destroy, location: imports_path)
  end

  def make_snapshots
    Resque.enqueue(AutopartsImporter, import.id)
    import.load_in_progress!
    redirect_to imports_path
  end

  def necessary_columns
    respond_with(import.necessary_columns, location: request.referrer)
  end

  def update_columns
    import.update_attributes(necessary_columns_params)
    respond_with(import)
  end

  private

  def import
    @import ||= Imports::Base.find_by_id(params[:id])
  end

  def import_params
    params.require(:import).permit!
  end

  def necessary_columns_params
    params.require(:import).permit(:necessary_columns)
  end
end
