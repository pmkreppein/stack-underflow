class QuestionsController < ApplicationController
  before_action :auth_required, except: :index
  def index
    if params[:user_id] && user = User.find_by_id(params[:user_id])
      @questions = user.questions
      respond_to do |f|
        f.json {render json: @questions, :each_serializer => QuestionsSerializer}
        f.html
      end
    else
      @questions = Question.all
      respond_to do |f|
        f.json {render json: @questions}
        f.html
      end
  end
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
    @answer = Answer.new
    @question = Question.find(params[:id])
    respond_to do |f|
      f.json {render json: @question, :status => 200}
      f.html {}
    end
  end

  private

  def question_params # strong parameters
    params.require(:question).permit(:category, :question_text)
  end
end
