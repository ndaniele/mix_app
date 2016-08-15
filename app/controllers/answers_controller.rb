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
    @answers = @question.answers.build
  end

  def create
    #raise params.inspect
    @question =  Question.find_by(id: params[:question_id])
    @answer = @question.answers.build(answer_params)
   # @answer = Answer.new(answer_params)
    #@answer.id = Question.find_by(id: params[:id])
    @answer.save
   redirect_to question_answer_path(@question, @answer)
  end


  private

  def answer_params
    params.require(:answer).permit(:input)
  end

end
