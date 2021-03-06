class AnswersController < ApplicationController

  def new
    @question =  Question.find_by(id: params[:question_id])
    if @question == nil
        redirect_to root_path
    else
      #flash[:error] = "please select a question to answer"
      redirect_to question_path(@question)
    end
  end

  def show
    @question = Question.find_by(id: params[:question_id])
    @answers = @question.answers.build

    @question_answer = Question.find_by(:id => @question.id).answers.first
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @question_answer }
    end
  end

  def create
    @question =  Question.find_by(id: params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id #session[:user_id]
    if
      @answer.save
      redirect_to question_answer_path(@question, @answer)
    else
      flash[:error] = "!!You can only answer a question once!!"
      redirect_to question_path(@question)
    end
  end


  private

  def answer_params
    params.require(:answer).permit(:input)
  end

end
