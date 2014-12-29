class ContentsController < ApplicationController
  respond_to :html, :js

  before_filter :have_access?, except: [:index, :show]
  before_filter :content, except: [:index, :new, :create]

  def new
    respond_with(@content)
  end

end
