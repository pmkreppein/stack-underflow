class AnswersController < ApplicationController
  before_action :auth_required
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = session[:user_id]
    if @answer.save
      respond_to do |f|
        f.html {redirect_to question_path(@question)}
        f.json {render json: @answer}
      end
    else
      @answers = Answer.where(question_id: params[:question_id])
      render :"questions/show"
    end
  end

  private

  def answer_params # strong parameters
    params.require(:answer).permit(:answer_text)
  end
end
