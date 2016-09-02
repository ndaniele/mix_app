class UsersController < ApplicationController
  def show
    @user = current_user #User.find_by(:id => params[:id])
    @user_questions = @user.asked_questions
    @answers = Answer.where(:user_id => @user.id)
  end

  def create
    @user = User.new(:email => params[:user][:email], :password => params[:user][:password]) 
    if 
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render '/users/sign_up' #'users/new'
    end   
  end

  def new
    @user = User.new
  end

end