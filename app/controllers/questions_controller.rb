class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        user = current_user
        question = user.questions.build(question_params)

        if question.save
            redirect_to question_path(question)
        else
            @question = question
            render :new
        end
    end

    def show
        @answer = Answer.new()
        @question = Question.find(params[:id])
        @answers = Answer.where({question_id: params[:id]})
        render :show
    end
    private

    def question_params # strong parameters
      params.require(:question).permit(:category, :question_text)
    end


end
