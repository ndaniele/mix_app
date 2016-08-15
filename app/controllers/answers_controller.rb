require 'pry'
class AnswersController < ApplicationController

  #def index
    #raise params.inspect
    #@question = Question.find_by(id: params[:question_id])
    #@answers = @question.answers
    #@answers = Answer.all
  #end

  def show
    #raise params.inspect
    @question = Question.find_by(id: params[:question_id])
    @answers = @question.answers
  end

  def create
#binding.pry
    #raise params.inspect
    #@question =  Question.find_by(id: params[:id])
    #@answer = @question.answers.build(:input => params[:input])
   # @answer = Answer.new(answer_params)
    #@answer.id = Question.find_by(id: params[:id])
    #@answer.save
   # redirect_to answer_path
  end


  private

  def answer_params
    params.require(:answer).permit(:input, :question_id)
  end

end
