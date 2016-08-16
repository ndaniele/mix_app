class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #raise params.inspect
    #@user = User.new
    #@user.email = params[:user][:email]
    #@user.save
    
    @user = User.new(:email => params[:user][:email], :password => params[:user][:password]) 
    if 
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'users/new'
    end   
  end
  
end
