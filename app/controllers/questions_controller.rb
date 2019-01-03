class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def new
        @question = Question.new
    end

    def create
        raise params.inspect
    end
end
