class QuestionsController < ApplicationController

  def index
    @questions = Question.all 
  end

  def new
    @question = Question.new 
  end

  def create
    #raise params.inspect
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

  def show
  end

  private 

  def question_params
    params.require(:question).permit(:query)
  end

end
