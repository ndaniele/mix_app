require 'pry'
class QuestionsController < ApplicationController

  def index
    @questions = Question.all 
  end

  def new
    @question = Question.new 
  end

  def create
    raise params.inspect
    @question = Question.new(question_params)
    @question.save
    redirect_to questions_path
  end

#  def edit
#    raise params.inspect
#  end

  def update
    @question = Question.find(params[:id])

    @question.update(question_params)

#binding.pry

    redirect_to @question
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
    params.require(:question).permit(:query, :answer_attributes => [:input])
  end

end
