class NewsController < ContentsController
  before_filter :content, except: [:index, :new, :create]
  before_filter :categories, only: [:index, :show]

  def index
    @news = NewsService.new(params: params).perform
    respond_with(@news)
  end

  def new
    @content = News.new
    super
  end

  def create
    @content = News.new(news_params.merge(user: current_user))
    if @content.save
      respond_with(@content, location: news_index_path)
    else
      respond_with(@content)
    end
  end

    def update
    respond_with(content.update_attributes(service_params), location: services_path)
  end

  def destroy
    respond_with(content.destroy, location: services_path)
  end

  private

  def news_params
    params.require(:news).permit!
  end

  def categories
    @categories = Category.all
  end

  def content
    @article ||= News.find(params[:id])
  end
end
