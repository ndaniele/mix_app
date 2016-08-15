require 'pry'
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
    redirect_to questions_path  #=> goes to answers#show
  end

  #def edit
    #raise params.inspect
    #@question.answers.build
  #end

  def update
    #raise params.inspect
    @question = Question.find(params[:id])

    @question.update(question_params)

#binding.pry
    
    redirect_to question_answer_path(@question)

    #redirect_to @question
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = @question.answers.build
  end

  def destroy
    #raise params.inspect
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
    params.require(:question).permit(:query, :answers_attributes => [:input])
  end

end
