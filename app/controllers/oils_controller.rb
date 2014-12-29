class OilsController < ApplicationController
  respond_to :html

  before_filter :oil, except: [:index, :new, :create, :import]

  def index
    @oils = Oil.all
    respond_with(@oils)
  end

  def new
    @oil = Oil.new
    respond_with(@oil)
  end

  def create
    respond_with(@oil, location: oils_path)
  end

  def edit
    respond_with(oil)
  end

  def update
    oil.update_attributes(oil_params)
  end

  def destroy
    oil.destroy
  end

  private

  def oil
    @oil ||= oil.find_by_id(params[:id])
  end

  def autopart_params
    params.require(:oil).permit!
  end
end
