class QuestionsController < ApplicationController
  respond_to :html, :json

  before_filter :categories, except: [:create, :destroy]
  before_filter :question, except: [:index, :new, :create]

  def index
    @questions = QuestionsService.new(params: params).perform
  end

  def new
    respond_with(@question = Question.new)
  end

  def create
    respond_with(current_user.questions.create(question_params))
  end

  def destroy
    respond_with(question.destroy, location: questions_path)
  end

  private

  def question
    @question ||= Question.find(params[:id])
  end

  def categories
    @categories = Category.all
  end

  def question_params
    params.require(:question).permit!
  end
end
