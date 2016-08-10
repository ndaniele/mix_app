require 'pry'
class AnswersController < ApplicationController

  def index
    raise params.inspect
    @answers = Answer.all
  end

  def show
    raise params.inspect
  end

  def create
#binding.pry
    #raise params.inspect
    @answer = @question.answers.build(:input => params[:input])
   # @answer = Answer.new(answer_params)
    #@answer.id = Question.find_by(id: params[:id])
   # @answer.save
   # redirect_to answer_path
  end


  private

  def answer_params
    params.require(:answer).permit(:input, :question_id)
  end

end
