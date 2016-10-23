class QuestionsController < ApplicationController
  #before_action :authentication_required

   def question_data
    question = Question.find(params[:id])
    render json: QuestionSerializer.serialize(question)
    #render question.to_json
  end

  def index
    #if you're not logged in you can't see this, goto login page
    #raise params.inspect
    @user = current_user
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
    @group = Group.find_by(:id => params[:question][:group_id])
    if 
      @question.save
      @group_question = GroupQuestion.create(:group_id => @group.id, :question_id => @question.id)
      #redirect_to questions_path 
      render json: @question, status: 201
    else
      flash[:error] = "#{@question.errors.full_messages.join(" & ")}"
      redirect_to new_question_path(:group => @group.id)
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_answer_path(@question)
  end

  def show
    @question = Question.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @question}
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
    question_id = Question.most_popular
    @question = Question.find_by(:id => question_id)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @question}
    end
  end


private 

  def question_params
    params.require(:question).permit(:query, {:answers_attributes => [:input, :user_id]})
  end



end
