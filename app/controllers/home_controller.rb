class HomeController < ApplicationController
  def index
    @partners = Partner.all.sample(3)
    @news = News.last(4)
    @services = Service.all.sample(4)
    @certificates = Certificate.all.sample(3)
  end
end
