class QuestionsController < ApplicationController
  before_action :authentication_required

  def index
    #if you're not logged in you can't see this, goto login page
    @questions = Question.all 
  end

  def new
    @question = Question.new 
  end

  def create
    #raise params.inspect
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    @question.save
    redirect_to questions_path  #=> goes to answers#show
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_answer_path(@question)
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = @question.answers.build
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @answers = Answer.where(question_id: @question.id)
    @question.destroy

      @answers.each do |answer|
        answer.destroy
      end

    redirect_to questions_path
  end

  private 

  def question_params
    params.require(:question).permit(:query, :answers_attributes => [:input, :user_id])
  end

end
