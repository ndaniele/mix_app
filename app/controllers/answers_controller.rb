class AnswersController < ApplicationController

  def show
    @question = Question.find_by(id: params[:question_id])
    @answers = @question.answers.build
  end

  def create
    @question =  Question.find_by(id: params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = session[:user_id]
    if 
      @answer.save
      redirect_to question_answer_path(@question, @answer)
    else
      redirect_to user_path(current_user)
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:input)
  end

end
