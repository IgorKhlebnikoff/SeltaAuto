class CategoriesController < ApplicationController
  respond_to :html

  before_filter :category, except: [:new, :create]

  def new
    @category = Category.new
    respond_with(@category)
  end

  def create
    respond_with(Category.create(category_params), location: news_index_path)
  end

  def update
    category.update(category_params)
    respond_with(category)
  end

  def destroy
    respond_with(category.destroy)
  end

  private

  def category
    @category ||= Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit!
  end
end
