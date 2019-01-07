class AnswersController < ApplicationController
    def create
        answer = Answer.new(answer_params)
        answer.user_id = 1
        if answer.save
            redirect_to question_path(params[:question_id])
        else 
            @question = Question.find(params[:question_id])
            @answer = answer
            render :"questions/show"
        end
    end
    private

    def answer_params # strong parameters
      params.require(:answer).permit(:answer_text, :question_id)
    end
end
