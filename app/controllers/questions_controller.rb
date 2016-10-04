class QuestionsController < ApplicationController
  #before_action :authentication_required

  def index
    #if you're not logged in you can't see this, goto login page
    #raise params.inspect
    if current_user.nil?
      redirect_to new_user_session_path
    else
    @group_questions = GroupQuestion.where(:group_id => 0)
    #@questions = Question.all.where(:group_id => 0)
    end 
  end

  def new
    #raise params.inspect
    @group = Group.find(params[:group])
    @question = Question.new 
    @question.answers.build
  end

  def create
    #raise params.inspect
    @question = current_user.asked_questions.build(question_params)
    #@question.user_id = current_user.id #session[:user_id]
    if 
      @question.save
      redirect_to questions_path  #=> goes to answers#show
    else
      flash[:error] = "#{@question.errors.full_messages.join(" & ")}"
      #binding.pry
      redirect_to new_question_path(:group => @question.group.id)
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_answer_path(@question)
  end

  def show
    @question = Question.find_by(id: params[:id])
    if current_user 
      @answer = @question.answers.build
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @answers = Answer.where(question_id: @question.id)
    @question.destroy

      @answers.each do |answer|
        answer.destroy
      end
      redirect_to user_path(current_user)
    #redirect_to questions_path
  end

  def most_popular
  end


private 

  def question_params
    params.require(:question).permit(:query, :group_id, {:answers_attributes => [:input, :user_id]})
  end



end
