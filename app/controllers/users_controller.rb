class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(:email => params[:user][:email], :password => params[:user][:password]) 
    if 
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'users/new'
    end   
  end

  def show
    @user = User.find_by(:id => params[:id])
  end
  
end
