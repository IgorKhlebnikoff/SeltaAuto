class AnswersController < ApplicationController
  respond_to :json

  before_filter :question

  def index
    answers = question.answers.page(params[:page]).per(10)
    respond_with(answers, location: request.referrer)
  end

  def create
    respond_with(question.answers.create(answer_params.merge(user: current_user)), location: request.referrer)
  end

  def destroy
    respond_with(question.answers.find_by_id(params[:id]).destroy, location: request.referrer)
  end

  private

  def question
    @question ||= Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit!
  end
end
