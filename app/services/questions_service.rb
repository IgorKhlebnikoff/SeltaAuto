class QuestionsService < BaseService
  def perform
    questions = if params[:filter_by]
                  Question.filter_by(params[:filter_by])
                else
                  Question.all
                end
    questions.order('created_at DESC').page(params[:page]).per(10)
  end
end
