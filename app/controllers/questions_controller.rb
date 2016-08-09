class QuestionsController < ApplicationController

  def index
    @questions = Question.all 
  end

  def new
    @question = Question.new 
  end

  def create
    #raise params.inspect
   # @question = Question.new(params[:query])
   # @question.save
  end

  def show
  end

  private 

#  def question_params
#    params.require(:question).permit(:query)
#  end

end
