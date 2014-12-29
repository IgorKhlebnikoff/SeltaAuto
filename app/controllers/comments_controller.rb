class CommentsController < ApplicationController
  respond_to :json

  before_filter :article

  def index
    comments = article.comments.page(params[:page]).per(10)
    respond_with(comments, location: request.referrer)
  end

  def create
    respond_with(article.comments.create(comment_params.merge(user: current_user)), location: request.referrer)
  end

  def destroy
    respond_with(article.comments.find_by_id(params[:id]).destroy, location: request.referrer)
  end

  private

  def article
    @article ||= News.find(params[:news_id])
  end

  def comment_params
    params.require(:comment).permit!
  end
end
