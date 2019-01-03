class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        q = Question.new(:question_text => params[:question][:question_text])
        q.save
        redirect_to questions_path
    end
end
