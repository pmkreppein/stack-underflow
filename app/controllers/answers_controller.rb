class AnswersController < ApplicationController
    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        @answer.user_id = 1
        if @answer.save
            redirect_to question_path(@question)
        else 
            @answers = Answer.where({question_id: params[:question_id]})
            render :"questions/show"
        end
    end
    private

    def answer_params # strong parameters
      params.require(:answer).permit(:answer_text)
    end
end
