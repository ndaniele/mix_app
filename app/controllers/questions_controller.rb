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
    @question = Question.find_by(id: params[:id])
  end

  def destroy
    #raise params.inspect
    Question.find_by(id: params[:id]).destroy
    redirect_to questions_path
  end

  private 

  def question_params
    params.require(:question).permit(:query)
  end

end
