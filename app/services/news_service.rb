class NewsService < BaseService
  def perform
    news = if params[:filter_by]
             News.filter_by(params[:filter_by])
           else
             News.all
           end
    news.order('id ASC').page(params[:page]).per(5)
  end
end
